module Fluent
  class FnordMetricOutput < Output
    Fluent::Plugin.register_output("fnordmetric", self)

    attr_reader :api

    config_param :redis_url, :string, :default => "redis://localhost:6379"
    config_param :redis_prefix, :string, :default => "fnordmetric"
    config_param :event_queue_ttl, :integer, :default => 120
    config_param :event_data_ttl, :integer, :default => 3600*24*30

    def initialize
      require 'fnordmetric'
      super
    end

    def configure(conf)
      @api = FnordMetric::API.new(conf)
      super
    end

    def start
      super
    end

    def shutdown
      @api.disconnect
      super
    end

    def emit(tag, es, chain)
      es.each { |time,record|
        @api.event(:_type => tag, :info => record)
      }
      chain.next
    end
  end
end
