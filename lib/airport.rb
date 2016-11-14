require_relative 'weather.rb'
require_relative 'plane.rb'


class Airport

attr_accessor :plane, :weather, :capacity

def initialize(weather = "calm", capacity = 20)
@plane = []
@weather = weather
@capacity = capacity
end

def grant_permission
  if weather == "stormy"
    granted = false
  elsif @plane.count >= capacity
    granted = false
  else
    granted = true
  end
  granted
end

def landed(plane)
  @plane << plane
  @plane
end

def take_off_request(granted = true)
if @plane == []
  granted = false
  "There are no planes in the airport"
elsif weather == "stormy"
  granted = false
else
  granted = true
  puts "You have permission to take off"
end
take_off_plane = @plane.pop
granted
end

def taken_off(confirmed = true)
  confirmed
end


def weather_report
 weather = Weather.new
 @weather = weather.report
end

def weather_report_stormy
  @weather = "stormy"
end

def weather_report_calm
  @weather = "calm"
end

end
