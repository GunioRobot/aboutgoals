require File.dirname(__FILE__) + '/../spec_helper'

describe GoalsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/goals" }.should route_to(:controller => "goals", :action => "index")
    end

    it "recognizes and generates #index" do
      { :get => "/goals/summary" }.should route_to(:controller => "goals", :action => "summary")
    end

    it "recognizes and generates #new" do
      { :get => "/goals/new" }.should route_to(:controller => "goals", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/goals/1" }.should route_to(:controller => "goals", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/goals/1/edit" }.should route_to(:controller => "goals", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/goals" }.should route_to(:controller => "goals", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/goals/1" }.should route_to(:controller => "goals", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/goals/1" }.should route_to(:controller => "goals", :action => "destroy", :id => "1") 
    end
  end
end
