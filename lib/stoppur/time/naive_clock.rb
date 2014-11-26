# encoding: utf-8

module Stoppur
  module Time
    class NaiveClock
      def time
        ::Time.now.to_f
      end
    end
  end
end
