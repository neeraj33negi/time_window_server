module TimeWindowServer
  module Middlewares
    class TimeLimiter
      BEGIN_HOUR = 7
      END_HOUR = 15
      def initialize(app)
        puts "--------------------[TimeWindowServer] Middleware called at #{Time.now}----------------"
        Rails.logger.info("--------------------[TimeWindowServer] Middleware called at #{Time.now}----------------")
        @app = app
      end

      def call(env)
        current_time = Time.current
        current_hour = current_time.hour

        if current_hour < BEGIN_HOUR || current_time > END_HOUR
          Rails.logger.info("--------------------OUTSIDE HOURS----------------")
          [
            503,
            { "Content-Type" => "application/json" },
            [{ status: :unvailable, message: "Available b/w hours #{BEGIN_HOUR} to #{END_HOUR}" }]
          ]
        else
          @app.call(env)
        end
      end
    end
  end
end
