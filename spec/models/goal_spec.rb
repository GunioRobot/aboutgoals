require File.dirname(__FILE__) + '/../spec_helper'

describe Goal do
  before(:each) do
    @valid_attributes = {
      :name => 'some short name'
    }
    @it = Goal.create!(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    Goal.create!(@valid_attributes)
  end

  shared_examples_for 'goal :not_started' do
    it "should have status :not_started" do
       @it.status.should == :not_started 
    end
    
    it "is returned by class method find_all_with_no_activities" do
      Goal.find_all_with_no_activities.should == [@it]
    end

    it "is not returned by class method find_all_in_progress" do
      Goal.find_all_in_progress.should_not == [@it]
    end

    it "is not returned by class method find_all_with_all_activities_complete" do
      Goal.find_all_with_all_activities_complete.should_not == [@it]
    end
  end

  shared_examples_for 'goal :in_progress' do
    it "should have status :in_progress" do
       @it.status.should == :in_progress 
    end

    it "is not returned by class method find_all_with_no_activities" do
      Goal.find_all_with_no_activities.should_not == [@it]
    end

    it "is returned by class method find_all_in_progress" do
      Goal.find_all_in_progress.should == [@it]
    end

    it "is not returned by class method find_all_with_all_activities_complete" do
      Goal.find_all_with_all_activities_complete.should_not == [@it]
    end
  end

  shared_examples_for 'goal :for_review' do
    it "should have status :for_review" do
       @it.status.should == :for_review 
    end

    it "is not returned by class method find_all_with_no_activities" do
      Goal.find_all_with_no_activities.should_not == [@it]
    end

    it "is not returned by class method find_all_in_progress" do
      Goal.find_all_in_progress.should_not == [@it]
    end

    it "is returned by class method find_all_with_all_activities_complete" do
      Goal.find_all_with_all_activities_complete.should == [@it]
    end
  end

  shared_examples_for 'goal :fully_complete' do
    it "should have status :fully_complete" do
       @it.status.should == :fully_complete 
    end
  end
  
  context "with no activities" do
    it_should_behave_like 'goal :not_started'

    context "and with goal set as complete" do
      before(:each) { @it.complete = true }
      it_should_behave_like 'goal :fully_complete'
    end
  end
  
  context "with one incomplete activity" do
    before(:each) do
      @it.activities.create(:complete => false, :name => 'act_incomplete')
    end

    it_should_behave_like 'goal :in_progress'

    it "should have incomplete_activity.count = 1" do
      @it.incomplete_activities.count.should == 1
    end

    context "and with goal set as complete" do
      before(:each) { @it.complete = true }
      it_should_behave_like 'goal :fully_complete'
    end

    context "and one complete activity" do
      before(:each) do
        @it.activities.create(:complete => true, :name => 'act_complete')
      end

      it "incomplete_activities should return only the incomplete activity" do
        @it.incomplete_activities.count.should == 1
        @it.incomplete_activities.first.name.should == 'act_incomplete'
      end

      it_should_behave_like 'goal :in_progress'

      context "and with goal set as complete" do
        before(:each) { @it.complete = true }
        it_should_behave_like 'goal :fully_complete'
      end
    end
  end

  context "with one complete activity" do
    before(:each) do
      @it.activities.create(:complete => true, :name => 'act_complete')
    end

    it_should_behave_like 'goal :for_review'

    it "should have incomplete_activity.count = 0" do
      @it.incomplete_activities.count.should == 0
    end
    
    context "and with goal set as complete" do
      before(:each) { @it.complete = true }
      it_should_behave_like 'goal :fully_complete'
    end
  end
  
end
