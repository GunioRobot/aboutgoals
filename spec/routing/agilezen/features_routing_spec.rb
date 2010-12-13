require 'spec_helper'

describe Agilezen::FeaturesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/agilezen/features" }.should route_to(:controller => "agilezen/features", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/agilezen/features/1" }.should route_to(:controller => "agilezen/features", :action => "show", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/agilezen/features/1" }.should route_to(:controller => "agilezen/features", :action => "destroy", :id => "1") 
    end
  end
end
