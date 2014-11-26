# encoding: utf-8

module Stoppur
  module Time
    class JavaClock
      def time
        java.lang.System.nano_time / 1e9
      end
    end
  end
end
