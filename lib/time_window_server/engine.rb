module TimeWindowServer
  class Engine < ::Rails::Engine
    isolate_namespace TimeWindowServer

    initializer "time_window_server.add_middleware" do |app|
      app.middleware.use TimeWindowServer::Middlewares::TimeLimiter
    end
  end
end
