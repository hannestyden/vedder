module Vedder
  LocationForecast = Struct.new(:latitude, :longitude) do
    def document
      Nokogiri::XML::Document.new
    end
  end
end
