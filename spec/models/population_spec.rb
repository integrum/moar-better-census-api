require 'spec_helper'

describe Population do
  it "should include the year for which you want data" do
    sut = Population.new :key => 'hoy-there', :year => 2010, :get => "WHATEVS", :for => "state:04"
    sut.url.should include("http://api.census.gov/data/2010/sf1?key=hoy-there&get=WHATEVS&for=state:04")
  end
  it "should provide sensible defaults for the data you want and for which states" do
    sut = Population.new :key => 'hoy-there', :year => 2010
    sut.url.should include("http://api.census.gov/data/2010/sf1?key=hoy-there&get=P0010001,NAME&for=state:*")
  end
end
