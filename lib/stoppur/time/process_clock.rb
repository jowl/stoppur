# encoding: utf-8

module Stoppur
  module Time
    class ProcessClock
      def time
        Process.clock_gettime(Process::CLOCK_MONOTONIC)
      end
    end
  end
end
