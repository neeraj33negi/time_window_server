require 'time_window_server/middlewares/time_limiter'
require 'time_window_server/configuration'

module TimeWindowServer
  class Engine < ::Rails::Engine
    isolate_namespace TimeWindowServer

    config.time_window_server = Configuration.new

    initializer "time_window_server.add_middleware" do |app|
      app.middleware.use TimeWindowServer::Middlewares::TimeLimiter, config.time_window_server
    end
  end
end
