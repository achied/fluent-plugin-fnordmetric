$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'test/unit'
require 'fluent/test'
require 'mock_redis'

class Test::Unit::TestCase
end

module RedisWrapper

  def self.included base

    base.class_eval do
      
      attr_reader :redis
      @@opts = nil

      def connect
        @redis = MockRedis.new(:url => @@opts[:redis_url])
      end

    end

  end

end
