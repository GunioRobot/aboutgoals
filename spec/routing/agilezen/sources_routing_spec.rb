require 'spec_helper'

describe Agilezen::SourcesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/agilezen/sources" }.should route_to(:controller => "agilezen/sources", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/agilezen/sources/new" }.should route_to(:controller => "agilezen/sources", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/agilezen/sources/1" }.should route_to(:controller => "agilezen/sources", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/agilezen/sources/1/edit" }.should route_to(:controller => "agilezen/sources", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/agilezen/sources" }.should route_to(:controller => "agilezen/sources", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/agilezen/sources/1" }.should route_to(:controller => "agilezen/sources", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/agilezen/sources/1" }.should route_to(:controller => "agilezen/sources", :action => "destroy", :id => "1")
    end
  end
end
