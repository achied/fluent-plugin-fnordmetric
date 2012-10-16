require 'test_helper'

class FnordMetricOutputTest < Test::Unit::TestCase

  CONFIG = %[
    redis_url redis://localhost:6379
    redis_prefix fnordmetric
    event_queue_ttl 120
    event_data_ttl 2592000
  ]

  def setup
    require 'lib/fluent/plugin/out_fnordmetric'
    require 'fnordmetric'
    FnordMetric::API.send(:include, RedisWrapper)
  end


  def create_driver(conf=CONFIG)
     Fluent::Test::OutputTestDriver.new(Fluent::FnordMetricOutput).configure(conf)
  end

  def test_configure
    d = create_driver
    assert_equal 'redis://localhost:6379', d.instance.redis_url
    assert_equal 'fnordmetric', d.instance.redis_prefix
    assert_equal 120, d.instance.event_queue_ttl
    assert_equal 2592000, d.instance.event_data_ttl
  end

  def test_event
    d = create_driver
    time = Time.parse("2011-01-02 13:14:15 UTC").to_i
    d.tag = "fnordmetric"
    d.emit({"a"=>1}, time)
    event_id = d.instance.api.redis.lpop("#{d.instance.redis_prefix}-queue")
    event = d.instance.api.redis.get "#{d.instance.redis_prefix}-event-#{event_id}"
    event_json = JSON.parse(event)
    assert_equal event_json["_type"], d.tag
    assert_equal event_json["info"], {"a"=>1}
  end

end
