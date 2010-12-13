require 'spec_helper'

describe Agilezen::FeaturesController do

  def mock_feature(stubs={})
    @mock_feature ||= mock_model(Agilezen::Feature, stubs)
  end

  describe "GET index" do
    it "assigns all agilezen_features as @agilezen_features" do
      Agilezen::Feature.stub(:find).with(:all).and_return([mock_feature])
      get :index
      assigns[:agilezen_features].should == [mock_feature]
    end
  end

  describe "GET show" do
    it "assigns the requested feature as @agilezen_feature" do
      Agilezen::Feature.stub(:find).with("37").and_return(mock_feature)
      get :show, :id => "37"
      assigns[:agilezen_feature].should equal(mock_feature)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested feature" do
      Agilezen::Feature.should_receive(:find).with("37").and_return(mock_feature)
      mock_feature.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the agilezen_features list" do
      Agilezen::Feature.stub(:find).and_return(mock_feature(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(agilezen_features_url)
    end
  end

end
