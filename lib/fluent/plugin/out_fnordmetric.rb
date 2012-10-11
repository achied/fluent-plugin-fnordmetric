module Fluent
  class FnordmetricOutPut < Output
    Fluent::Plugin.register_output("fnordmetric", self)

    def initialize
      require 'fnordmetric'

      FnordMetric.options = {
        :event_queue_ttl => 10,
        :event_data_ttl => 10,
        :session_data_ttl => 1,
        :redis_prefix => "fnordmetric"
      }

      @api = FnordMetric::API.new
      super
    end

    def configure(conf)
      super
    end

    def start
      super
    end

    def shutdown
      super
    end

    def emit(tag, es, chain)
      es.each { |time,record|
        @api.event(:_type => :tag, :info => record)
      }
    end
  end
end
