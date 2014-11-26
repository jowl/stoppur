# encoding: utf-8

require 'spec_helper'

module Stoppur
  describe Clock do
    let :clock do
      described_class.new
    end

    describe '#time' do
      it 'returns something that responds to #-' do
        expect(clock.time).to respond_to(:-)
      end
    end
  end
end
