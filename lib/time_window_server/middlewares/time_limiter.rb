module TimeWindowServer
  module Middlewares
    class TimeLimiter
      def initialize(app, config)
        @app = app
        @config = config
      end

      def call(env)
        current_time = Time.now.in_time_zone(@config.time_zone)
        current_hour = current_time.hour

        if current_hour < @config.start_hour || current_hour > @config.end_hour
          body = { status: :unvailable, message: "Available b/w hours #{@config.start_hour} to #{@config.end_hour}" }.to_json
          [
            503,
            {
              "Content-Type" => "application/json",
              "Content-Length" => body.bytesize.to_s,
            },
            [body]
          ]
        else
          @app.call(env)
        end
      end
    end
  end
end
