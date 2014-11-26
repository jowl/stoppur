# encoding: utf-8

module Stoppur
  class Stopwatch
    def initialize(clock)
      @clock = clock
    end

    def start
      raise AlreadyStartedError if started?
      @start_time = @clock.time
      self
    end

    def elapsed
      raise NotStartedError unless started?
      @clock.time - @start_time
    end

    AlreadyStartedError = Class.new(StandardError)
    NotStartedError = Class.new(StandardError)

    private

    def started?
      @start_time
    end
  end
end
