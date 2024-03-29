require 'spec_helper'

describe ActivitiesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/activities" }.should route_to(:controller => "activities", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/activities/new" }.should route_to(:controller => "activities", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/activities/1" }.should route_to(:controller => "activities", :action => "show", :id => "1")
    end

    it "recognizes and generates #expanded" do
      { :get => "/activities/1/expanded" }.should route_to(:controller => "activities", :action => "expanded", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/activities/1/edit" }.should route_to(:controller => "activities", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/activities" }.should route_to(:controller => "activities", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/activities/1" }.should route_to(:controller => "activities", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/activities/1" }.should route_to(:controller => "activities", :action => "destroy", :id => "1") 
    end

    it "recognizes and generates #new_goal" do
      { :get => "/activities/1/new_goal" }.should route_to(:controller => "activities", :action => "new_goal", :id => "1")
    end

    it "recognizes and generates #create_goal" do
      { :post => "/activities/1/create_goal" }.should route_to(:controller => "activities", :action => "create_goal", :id => "1")
    end

  end
end
