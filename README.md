fluent-plugin-fnordmetric
=========================

fnordmetric plugin for fluent Event Collector

[![Build Status](https://secure.travis-ci.org/achied/fluent-plugin-fnordmetric.png)](http://travis-ci.org/achied/fluent-plugin-fnordmetric)


# Getting Started
Setup the fnordmetric onput:

~~~~~
  <target test.*>
    type fnordmetric
    host localhost
    port 4242
  </target>
~~~~~

