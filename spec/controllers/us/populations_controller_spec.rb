require 'spec_helper'

describe US::PopulationsController do
  describe '#show' do

    before :each do
      request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("some_key:")
      get :show, :format => :json
    end

    it "should return a 200" do
      response.status.should == 200
    end
  end
end
