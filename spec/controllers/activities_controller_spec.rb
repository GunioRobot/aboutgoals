require 'spec_helper'

describe ActivitiesController do

  def mock_goal(stubs={})
    @mock_model = mock_model(Goal, stubs) unless stubs.blank?
    @mock_model ||= mock_model(Goal, stubs)
  end

  def mock_activity(stubs={})
    @mock_activity = mock_model(Activity, stubs) unless stubs.blank?
    @mock_activity ||= mock_model(Activity, stubs)
  end

  describe "GET index" do
    it "assigns all activities as @activities" do
      Activity.stub(:find).with(:all).and_return([mock_activity])
      get :index
      assigns[:activities].should == [mock_activity]
    end
  end

  describe "GET show" do
    before(:each) do
      Activity.stub(:find).with("37").and_return(mock_activity(:goal => 'the associated goal'))
    end
    it "assigns the requested activity as @activity" do
      get :show, :id => "37"
      assigns[:activity].should equal(mock_activity)
    end

    it 'finds the goals' do
      get :show, :id => "37"
      assigns[:goals].should  == ['the associated goal']
    end
  end

  describe "GET expanded" do
    before(:each) do
      Activity.stub(:find).with("37").and_return(mock_activity(:goal => 'some goal'))
    end

    it "assigns the requested activity as @activity" do
      get :expanded, :id => "37"
      assigns[:activity].should equal(mock_activity)
    end

    it "assigns the parent goal as @parents array" do
      get :expanded, :id => "37"
      assigns[:parents].should == ['some goal']
    end
  end

  describe "GET new" do
    it "assigns a new activity as @activity" do
      Activity.stub(:new).and_return(mock_activity)
      get :new
      assigns[:activity].should equal(mock_activity)
    end
  end

  describe "GET edit" do
    it "assigns the requested activity as @activity" do
      Activity.stub(:find).with("37").and_return(mock_activity)
      get :edit, :id => "37"
      assigns[:activity].should equal(mock_activity)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created activity as @activity" do
        Activity.stub(:new).with({'these' => 'params'}).and_return(mock_activity(:save => true))
        post :create, :activity => {:these => 'params'}
        assigns[:activity].should equal(mock_activity)
      end

      it "redirects to the created activity" do
        Activity.stub(:new).and_return(mock_activity(:save => true))
        post :create, :activity => {}
        response.should redirect_to(activity_url(mock_activity))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activity as @activity" do
        Activity.stub(:new).with({'these' => 'params'}).and_return(mock_activity(:save => false))
        post :create, :activity => {:these => 'params'}
        assigns[:activity].should equal(mock_activity)
      end

      it "re-renders the 'new' template" do
        Activity.stub(:new).and_return(mock_activity(:save => false))
        post :create, :activity => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested activity" do
        Activity.should_receive(:find).with("37").and_return(mock_activity)
        mock_activity.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :activity => {:these => 'params'}
      end

      it "assigns the requested activity as @activity" do
        Activity.stub(:find).and_return(mock_activity(:update_attributes => true))
        put :update, :id => "1"
        assigns[:activity].should equal(mock_activity)
      end

      it "redirects to the activity" do
        Activity.stub(:find).and_return(mock_activity(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(activity_url(mock_activity))
      end
    end

    describe "with invalid params" do
      it "updates the requested activity" do
        Activity.should_receive(:find).with("37").and_return(mock_activity)
        mock_activity.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :activity => {:these => 'params'}
      end

      it "assigns the activity as @activity" do
        Activity.stub(:find).and_return(mock_activity(:update_attributes => false))
        put :update, :id => "1"
        assigns[:activity].should equal(mock_activity)
      end

      it "re-renders the 'edit' template" do
        Activity.stub(:find).and_return(mock_activity(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested activity" do
      Activity.should_receive(:find).with("37").and_return(mock_activity)
      mock_activity.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the activities list" do
      Activity.stub(:find).and_return(mock_activity(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(activities_url)
    end
  end

  describe "GET new_goal" do
    before(:each) do
      Activity.stub(:find).with("37").and_return(mock_activity(:build_goal =>  mock_goal ))
    end
  
    it "assigns the requested activity as @activity" do
      get :new_goal, :id => "37"
      assigns[:activity].should equal(mock_activity)
    end

    it "assigns the new goal as @goal" do
      get :new_goal, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end

    it "renders the 'new_goal' template" do
      get :new_goal, :id => "37"
      response.should render_template('new_goal')
    end
  end

  describe "POST create_goal" do
    before(:each) do
      Activity.stub(:find).with("37").and_return(mock_activity(:build_goal => mock_goal ))
    end
  
    it "assigns the requested goal as @goal" do
      mock_activity.stub(:build_goal).and_return(mock_goal(:save => true))
      mock_activity.stub(:save => true)
      post :create_goal, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end

    describe "with valid params" do
      it "assigns a newly created goal as @goal" do
        mock_activity.stub(:build_goal).with({'these' => 'params'}).and_return(mock_goal(:save => true))
        mock_activity.stub(:save => true)
        post :create_goal, :id => "37", :goal => {:these => 'params'}
        assigns[:goal].should equal(mock_goal)
      end

      it "redirects to the activity" do
        mock_activity.stub(:build_goal).and_return(mock_goal(:save => true))
        mock_activity.stub(:save => true)
        post :create_goal, :id => "37", :goal => {}
        response.should redirect_to(activity_url(mock_activity))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved goal as @goal" do
        mock_activity.stub(:build_goal).with({'these' => 'params'}).and_return(mock_goal(:save => false))
        mock_activity.stub(:save => false)
        post :create_goal, :id => "37", :goal => {:these => 'params'}
        assigns[:goal].should equal(mock_goal)
      end

      it "re-renders the 'new_goal' template" do
        mock_activity.stub(:build_goal).and_return(mock_goal(:save => false))
        mock_activity.stub(:save => false)
        post :create_goal, :id => "37", :goal => {}
        response.should render_template('new_goal')
      end
    end

  end


end
