require 'spec_helper'

describe Population do
  describe "URL generation" do
    it "should include the year for which you want data" do
      sut = Population.new :key => 'hoy-there', :year => 2010, :get => "WHATEVS", :for => "state:04"
      sut.url.should include("http://api.census.gov/data/2010/sf1?key=hoy-there&get=WHATEVS&for=state:04")
    end
    it "should provide sensible defaults for the data you want and for which states" do
      sut = Population.new :key => 'hoy-there', :year => 2010
      sut.url.should include("http://api.census.gov/data/2010/sf1?key=hoy-there&get=P0010001,NAME&for=state:*")
    end
  end

  describe '#to_json' do
    it "should return an empty hash" do
      population = Population.new :key => 'hoy-there', :year => 2010
      population.to_json.should == {}
    end
  end

  describe "Requesting Real Census Data" do
    it "should communicate with the real census api" do
      # sut = Population.new :key => 'foo', :year => 2010, :census_client => @
    end
  end
end
