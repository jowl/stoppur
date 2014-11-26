# encoding: utf-8

require 'spec_helper'

describe Stoppur do
  describe '.measure' do
    it "measures the block's execution time in seconds" do
      elapsed = described_class.measure { sleep 0.1 }
      expect(elapsed).to be_within(0.01).of(0.1)
    end

    it 'reraises any error from within the block' do
      expect { described_class.measure { raise 'spec error' } }.to raise_error(StandardError, 'spec error')
    end
  end

  describe '.start' do
    it 'returns a started Stopwatch' do
      expect { described_class.start.start }.to raise_error(described_class::Stopwatch::AlreadyStartedError)
    end
  end
end
