# Ensure gem is used over 1.9.x built in.
gem 'minitest' if RUBY_VERSION =~ /1.9.\d/

require 'minitest/spec'
require 'minitest/autorun'

$:.push File.expand_path('../../lib', __FILE__)
require 'vedder'

require 'vcr'
require './spec/support/vcr'

VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.stub_with :fakeweb
end

module Vedder
  module Version
    describe 'semantic' do
      it 'should be of version 0.0.0' do
        SEMANTIC.must_equal '0.0.0'
      end
    end
  end

  describe LocationForecast do
    let(:latitude)  { 52.5233 }
    let(:longitude) { 13.4127 }

    describe 'initialization' do
      it 'is initialized with latitude and longitude' do
        instance = LocationForecast.new(latitude, longitude)
        
        instance.latitude.must_equal  latitude
        instance.longitude.must_equal longitude
      end
    end

    describe 'interaction with api.met.no' do
      use_vcr_cassette 'location_forecast'

      subject do
        LocationForecast.new(latitude, longitude)
      end

      describe '#document' do
        it 'is a Nokogiri::XML::Document' do
          subject.document.must_be_instance_of Nokogiri::XML::Document
        end
      end
    end
  end
end
