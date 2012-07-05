# vedder

Ruby wrapper for the `api.met.no` weather web service.

# Examples

## `LocationForecast`

```ruby

location_forecast = Vedder::LocationForecast.new(52.5233, 13.4127)

location_forecast.meta.models.first.name
# => "YR"

location_forecast.meta.models.last.name
# => "EC.GEO.0.25"

location_forecast.forecasts.for(Time.parse('2012-07-06')..Time.parse('2012-07-07').map(&:temprature)[0..1]
# => [ 20.8, 20.9 ]
```

