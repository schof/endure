require 'spec_helper'

module Endure
  module Providers
    describe DynamoDB do
      subject { described_class.new({region: 'us-east-1',
                                     collection: 'bdq_orders',
                                     aws_key:    ENV['AWS_KEY'],
                                     aws_secret: ENV['AWS_SECRET'] }) }

      it 'should set key/value' do
        subject.set('abc', 'somevalue')
      end

      it 'should get key/value' do
        subject.set('abc', 'somevalue')
        document = subject.get('abc')
        expect(document).to eq 'somevalue'
      end

      it 'query should not be implemented' do
        expect{ subject.query }.to raise_error(NotImplementedError)
      end
    end
  end
end
