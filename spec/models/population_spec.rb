require 'spec_helper'

describe Population do
  it "should include the year for which you want data" do
    sut = Population.new :key => 'hoy-there', :year => 2010
    sut.url.should include("http://api.census.gov/data/2010/sf1?key=hoy-there")
  end

  describe '#to_json' do
    it "should return an empty hash" do
      population = Population.new :key => 'hoy-there', :year => 2010
      population.to_json.should == {}
    end
  end
end
