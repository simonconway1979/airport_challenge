require 'airport'
require 'plane'
require 'weather'

describe Plane do

subject(:plane) {described_class.new}
let(:airport) {double :airport}

it "should have a flight number that is a number" do
  expect(plane.flight_number).to be_an_instance_of(Fixnum)
end

it "should know that it is in the air" do
  expect(plane.flying).to eq(true)
end

it "should know that it is on the ground" do
  plane = Plane.new(false)
  expect(plane.flying).to eq(false)
end

it "should request permission to land" do
  expect(plane).to respond_to(:landing_request)
end

it "should receive permission to land from the airport" do
  allow(airport).to receive(:grant_permission).and_return(true)
  expect(plane.landing_request(airport)).to eq(true)
end

it "should be able to land" do
  expect(plane).to respond_to(:land)
end

it "should mark the plane as not flying when the plane lands" do
  allow(airport).to receive(:grant_permission).and_return(true)
  plane.landing_request(airport)
  expect(plane.land(airport)).to eq(false)
end

it "should not able able to land when permission to land is not granted" do
  allow(airport).to receive(:grant_permission).and_return(false)
  plane.landing_request(airport)
  expect(plane.land(airport)).to eq(true)
end



end
