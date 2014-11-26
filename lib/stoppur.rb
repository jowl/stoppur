# encoding: utf-8

require 'stoppur/clock'
require 'stoppur/stopwatch'

module Stoppur
  def self.measure(&block)
    stopwatch = start
    block.call
    stopwatch.elapsed
  end

  def self.start
    Stopwatch.new(DEFAULT_CLOCK).start
  end

  private

  DEFAULT_CLOCK = Clock.new
end
