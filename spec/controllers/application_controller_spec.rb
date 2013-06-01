require 'spec_helper'

describe ApplicationController do

  describe '#index' do

    context "no key provided" do
      before :each do
        get :index
      end

      it "should return a 401" do
        response.status.should == 401
      end
    end

    # context "key provided" do
    #   before :each do
    #     @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("some_key:")
    #   end

    #   it "should return a 200" do
    #     @response.should == 200
    #   end
    # end
  end
end
