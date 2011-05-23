require 'spec_helper'

describe Agilezen::TasksController do

  def mock_task(stubs={})
    @mock_task ||= mock_model(Agilezen::Task, stubs)
  end

  describe "GET index" do
    it "assigns all agilezen_tasks as @agilezen_tasks" do
      Agilezen::Task.stub(:find).with(:all).and_return([mock_task])
      get :index
      assigns[:agilezen_tasks].should == [mock_task]
    end
  end

  describe "GET show" do
    it "assigns the requested task as @agilezen_task" do
      Agilezen::Task.stub(:find).with("37").and_return(mock_task)
      get :show, :id => "37"
      assigns[:agilezen_task].should equal(mock_task)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      Agilezen::Task.should_receive(:find).with("37").and_return(mock_task)
      mock_task.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the agilezen_tasks list" do
      Agilezen::Task.stub(:find).and_return(mock_task(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(agilezen_tasks_url)
    end
  end

end
