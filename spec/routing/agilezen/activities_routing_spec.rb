require 'spec_helper'

describe Agilezen::ActivitiesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/agilezen/activities" }.should route_to(:controller => "agilezen/activities", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/agilezen/activities/1" }.should route_to(:controller => "agilezen/activities", :action => "show", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/agilezen/activities/1" }.should route_to(:controller => "agilezen/activities", :action => "destroy", :id => "1")
    end
  end
end
