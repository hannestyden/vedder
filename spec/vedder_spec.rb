# Ensure gem is used over 1.9.x built in.
gem 'minitest' if RUBY_VERSION =~ /1.9.\d/

require 'minitest/spec'
require 'minitest/autorun'

$:.push File.expand_path('../../lib', __FILE__)
require 'vedder'

module Vedder
  module Version
    describe 'semantic' do
      it 'should be of version 0.0.0' do
        SEMANTIC.must_equal '0.0.0'
      end
    end
  end

  describe LocationForecast do
    describe 'initialization' do
      it 'is initialized with latitude and longitude' do
        latitude  = 52.5233
        longitude = 13.4127

        instance = LocationForecast.new(latitude, longitude)
        
        instance.latitude.must_equal  latitude
        instance.longitude.must_equal longitude
      end
    end
  end
end
