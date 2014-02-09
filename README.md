fluent-plugin-fnordmetric, a plugin for [Fluentd](http://fluentd.org)
=========================

fnordmetric plugin for fluent Event Collector

[![Build Status](https://secure.travis-ci.org/achied/fluent-plugin-fnordmetric.png)](http://travis-ci.org/achied/fluent-plugin-fnordmetric)


# Getting Started
Setup the fnordmetric output:

~~~~~
  <match fnordmetric.*>
    type fnordmetric
    redis_url redis://localhost:6379
    redis_prefix fnordmetric
    event_queue_ttl 120
    event_data_ttl 2592000
  </match>
~~~~~

