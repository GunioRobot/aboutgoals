require 'spec_helper'

describe GoalsController do

  def mock_goal(stubs={})
    @mock_goal ||= mock_model(Goal, stubs)
  end

  describe "GET index" do
    it "assigns all goals as @goals" do
      Goal.stub(:find).with(:all).and_return([mock_goal])
      get :index
      assigns[:goals].should == [mock_goal]
    end
  end

  describe "GET summary" do
    it "assigns all goals as @goals" do
      Goal.stub(:find).with(:all).and_return([mock_goal])
      get :summary
      assigns[:goals].should == [mock_goal]
    end
  end

  describe "GET show" do
    it "assigns the requested goal as @goal" do
      Goal.stub(:find).with("37").and_return(mock_goal)
      get :show, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end
  end

  describe "GET expanded" do
    before(:each) do
      Goal.stub(:find).with("37").and_return(mock_goal(:tasks => 'some tasks'))
    end
     
    it "assigns the requested goal as @goal" do
      get :expanded, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end

    it "assigns the tasks as @children" do
      get :expanded, :id => "37"
      assigns[:children].should == 'some tasks'
    end
  end

  describe "GET new" do
    it "assigns a new goal as @goal" do
      Goal.stub(:new).and_return(mock_goal)
      get :new
      assigns[:goal].should equal(mock_goal)
    end
  end

  describe "GET edit" do
    it "assigns the requested goal as @goal" do
      Goal.stub(:find).with("37").and_return(mock_goal)
      get :edit, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created goal as @goal" do
        Goal.stub(:new).with({'these' => 'params'}).and_return(mock_goal(:save => true))
        post :create, :goal => {:these => 'params'}
        assigns[:goal].should equal(mock_goal)
      end

      it "redirects to the created goal" do
        Goal.stub(:new).and_return(mock_goal(:save => true))
        post :create, :goal => {}
        response.should redirect_to(goal_url(mock_goal))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved goal as @goal" do
        Goal.stub(:new).with({'these' => 'params'}).and_return(mock_goal(:save => false))
        post :create, :goal => {:these => 'params'}
        assigns[:goal].should equal(mock_goal)
      end

      it "re-renders the 'new' template" do
        Goal.stub(:new).and_return(mock_goal(:save => false))
        post :create, :goal => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested goal" do
        Goal.should_receive(:find).with("37").and_return(mock_goal)
        mock_goal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :goal => {:these => 'params'}
      end

      it "assigns the requested goal as @goal" do
        Goal.stub(:find).and_return(mock_goal(:update_attributes => true))
        put :update, :id => "1"
        assigns[:goal].should equal(mock_goal)
      end

      it "redirects to the goal" do
        Goal.stub(:find).and_return(mock_goal(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(goal_url(mock_goal))
      end
    end

    describe "with invalid params" do
      it "updates the requested goal" do
        Goal.should_receive(:find).with("37").and_return(mock_goal)
        mock_goal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :goal => {:these => 'params'}
      end

      it "assigns the goal as @goal" do
        Goal.stub(:find).and_return(mock_goal(:update_attributes => false))
        put :update, :id => "1"
        assigns[:goal].should equal(mock_goal)
      end

      it "re-renders the 'edit' template" do
        Goal.stub(:find).and_return(mock_goal(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested goal" do
      Goal.should_receive(:find).with("37").and_return(mock_goal)
      mock_goal.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the goals list" do
      Goal.stub(:find).and_return(mock_goal(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(goals_url)
    end
  end

end
