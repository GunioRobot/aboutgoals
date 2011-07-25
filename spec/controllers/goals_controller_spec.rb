require 'spec_helper'

describe GoalsController do

  def mock_goal(stubs={})
    @mock_model = mock_model(Goal, stubs) unless stubs.blank?
    @mock_model ||= mock_model(Goal, stubs)
  end

  def mock_activity(stubs={})
    @mock_activity = mock_model(Activity, stubs) unless stubs.blank?
    @mock_activity ||= mock_model(Activity, stubs)
  end

  describe "GET index" do
    it "assigns all goals as @goals" do
      Goal.stub(:find).with(:all).and_return([mock_goal])
      get :index
      assigns[:goals].should == [mock_goal]
    end
  end

  describe "GET summary" do
    before(:each) do
      Goal.stub(:find_all_not_started)
      Goal.stub(:find_all_in_progress)
      Goal.stub(:find_all_for_review)
      Goal.stub(:find_all_complete)
    end
    
    it "assigns all goals as @goals" do
      Goal.stub(:find).with(:all).and_return([mock_goal])
      get :summary
      assigns[:goals].should == [mock_goal]
    end

    it "assigns not started goals as @goals_not_started" do
      Goal.stub(:find_all_not_started).and_return('not_started_1')
      get :summary
      assigns[:goals_not_started].should == 'not_started_1'
    end

    it "assigns in progress goals as @goals_in_progress" do
      Goal.stub(:find_all_in_progress).and_return('in_progress_2')
      get :summary
      assigns[:goals_in_progress].should == 'in_progress_2'
    end

    it "assigns for review goals as @goals_for_review" do
      Goal.stub(:find_all_for_review).and_return('for_review_3')
      get :summary
      assigns[:goals_for_review].should == 'for_review_3'
    end

    it "assigns complete goals as @goals_complete" do
      Goal.stub(:find_all_complete).and_return('complete_4')
      get :summary
      assigns[:goals_complete].should == 'complete_4'
    end
  end

  describe "GET show" do
    before(:each) do
      Goal.stub(:find).with("37").and_return(mock_goal(:activities =>  'the associated activities' ))
    end
  
    it "assigns the requested goal as @goal" do
      get :show, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end

    it "finds the activities" do
      get :show, :id => "37"
      assigns[:activities].should == 'the associated activities'
    end
  end

  describe "GET expanded" do
    before(:each) do
      Goal.stub(:find).with("37").and_return(mock_goal(:activities => 'some activities'))
    end
     
    it "assigns the requested goal as @goal" do
      get :expanded, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end

    it "assigns the activities as @children" do
      get :expanded, :id => "37"
      assigns[:children].should == 'some activities'
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

  describe "GET new_activity" do
    before(:each) do
      assoc_proxy = stub('assoc_proxy')
      assoc_proxy.stub(:new).and_return(mock_activity)
      Goal.stub(:find).with("37").and_return(mock_goal(:activities =>  assoc_proxy ))
    end
  
    it "assigns the requested goal as @goal" do
      get :new_activity, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end

    it "assigns the new activity as @activity" do
      get :new_activity, :id => "37"
      assigns[:activity].should equal(mock_activity)
    end

    it "renders the 'new_activity' template" do
      get :new_activity, :id => "37"
      response.should render_template('new_activity')
    end

  end

  describe "POST create_activity" do
    before(:each) do
      @assoc_proxy = stub('assoc_proxy')
      Goal.stub(:find).with("37").and_return(mock_goal(:activities =>  @assoc_proxy ))
    end
  
    it "assigns the requested goal as @goal" do
      @assoc_proxy.stub(:new).and_return(mock_activity(:save => true))
      post :create_activity, :id => "37"
      assigns[:goal].should equal(mock_goal)
    end

    describe "with valid params" do
      it "assigns a newly created activity as @activity" do
        @assoc_proxy.stub(:new).with({'these' => 'params'}).and_return(mock_activity(:save => true))
        post :create_activity, :id => "37", :activity => {:these => 'params'}
        assigns[:activity].should equal(mock_activity)
      end

      it "redirects to the goal" do
        @assoc_proxy.stub(:new).and_return(mock_activity(:save => true))
        post :create_activity, :id => "37", :activity => {}
        response.should redirect_to(goal_url(mock_goal))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activity as @activity" do
        @assoc_proxy.stub(:new).with({'these' => 'params'}).and_return(mock_activity(:save => false))
        post :create_activity, :id => "37", :activity => {:these => 'params'}
        assigns[:activity].should equal(mock_activity)
      end

      it "re-renders the 'new_activity' template" do
        @assoc_proxy.stub(:new).and_return(mock_activity(:save => false))
        post :create_activity, :id => "37", :activity => {}
        response.should render_template('new_activity')
      end
    end

  end

end
