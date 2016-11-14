class Plane

attr_reader :flight_number, :flying, :permission

def initialize(flying = true)
@flight_number = 1001 + rand(9000)
@flying = flying
@permission = false
end

def landing_request(airport)
  @permission = airport.grant_permission
end

def land(airport)
  @flying = false unless @permission == false
  @flying
end

end
