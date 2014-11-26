# encoding: utf-8

module Stoppur
  if Process.respond_to?(:clock_gettime)
    require 'stoppur/time/process_clock'
    Clock = Time::ProcessClock
  else
    require 'stoppur/time/naive_clock'
    Clock = Time::NaiveClock
  end
end
