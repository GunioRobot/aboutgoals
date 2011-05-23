require 'spec_helper'

describe Agilezen::TasksController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/agilezen/tasks" }.should route_to(:controller => "agilezen/tasks", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/agilezen/tasks/1" }.should route_to(:controller => "agilezen/tasks", :action => "show", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/agilezen/tasks/1" }.should route_to(:controller => "agilezen/tasks", :action => "destroy", :id => "1") 
    end
  end
end
