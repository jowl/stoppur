# encoding: utf-8

require 'spec_helper'
require 'timecop'

module Stoppur
  describe Clock do
    let :clock do
      described_class.new
    end

    describe '#time' do
      let! :before do
        clock.time
      end

      it 'increases monotonically' do
        previous = before
        10_000.times do
          current = clock.time
          break if current - before > 0.1
          expect(current).to be >= previous
          previous = current
        end
      end

      it 'increases when time passes' do
        sleep 0.1
        expect(clock.time).to be > before
      end

      it 'increases despite (Ruby) Time is moving backwards' do
        Timecop.travel(-1) do
          sleep 0.1
          expect(clock.time).to be > before
        end
      end

      it 'returns time in seconds' do
        sleep 0.1
        expect(clock.time-before).to be_within(0.01).of(0.1)
      end
    end
  end
end
