module TimeWindowServer
  module Middlewares
    class TimeLimiter
      BEGIN_HOUR = 7
      END_HOUR = 20
      def initialize(app)
        @app = app
      end

      def call(env)
        current_time = Time.current
        current_hour = current_time.hour

        if current_hour < BEGIN_HOUR && current_time > END_HOUR
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
