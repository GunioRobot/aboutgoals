require 'spec_helper'

describe Agilezen::ActivitiesController do

  def mock_activity(stubs={})
    @mock_activity ||= mock_model(Agilezen::Activity, stubs)
  end

  describe "GET index" do
    it "assigns all agilezen_activities as @agilezen_activities" do
      Agilezen::Activity.stub(:find).with(:all).and_return([mock_activity])
      get :index
      assigns[:agilezen_activities].should == [mock_activity]
    end
  end

  describe "GET show" do
    it "assigns the requested activity as @agilezen_activity" do
      Agilezen::Activity.stub(:find).with("37").and_return(mock_activity)
      get :show, :id => "37"
      assigns[:agilezen_activity].should equal(mock_activity)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested activity" do
      Agilezen::Activity.should_receive(:find).with("37").and_return(mock_activity)
      mock_activity.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the agilezen_activities list" do
      Agilezen::Activity.stub(:find).and_return(mock_activity(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(agilezen_activities_url)
    end
  end

end
