# encoding: utf-8

module Stoppur
  if Process.respond_to?(:clock_gettime)
    require 'stoppur/time/process_clock'
    Clock = Time::ProcessClock
  elsif RUBY_PLATFORM == 'java'
    require 'stoppur/time/java_clock'
    Clock = Time::JavaClock
  else
    require 'stoppur/time/c_clock'
    Clock = Time::CClock
  end
end
