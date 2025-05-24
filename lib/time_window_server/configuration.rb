module TimeWindowServer
  class Configuration
    DEFAULT_BEGIN_HOUR = 7
    DEFAULT_END_HOUR = 15
    attr_accessor :start_hour, :end_hour, :time_zone

    def initialize
      @start_hour = DEFAULT_BEGIN_HOUR
      @end_hour = DEFAULT_END_HOUR
      @time_zone = "UTC"
    end
  end
end
