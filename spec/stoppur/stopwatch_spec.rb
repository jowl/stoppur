# encoding: utf-8

require 'spec_helper'

module Stoppur
  describe Stopwatch do
    let :stopwatch do
      described_class.new(clock)
    end

    let :clock do
      double(:clock, time: 0)
    end

    describe '#start' do
      it 'gets time from clock' do
        stopwatch.start
        expect(clock).to have_received(:time)
      end

      it 'raises AlreadyStartedError if called more than once' do
        stopwatch.start
        expect { stopwatch.start }.to raise_error(described_class::AlreadyStartedError)
      end

      it 'returns self' do
        expect(stopwatch.start).to eql(stopwatch)
      end
    end

    describe '#elapsed' do
      it 'gets time from clock' do
        stopwatch.start
        stopwatch.elapsed
        expect(clock).to have_received(:time).twice
      end

      it 'returns time since #start' do
        allow(clock).to receive(:time).and_return(3, 7, 8)
        stopwatch.start
        expect(stopwatch.elapsed).to eq(4)
        expect(stopwatch.elapsed).to eq(5)
      end

      it 'raises NotStartedError if stop watch has not been started' do
        expect { stopwatch.elapsed }.to raise_error(described_class::NotStartedError)
      end
    end
  end
end
