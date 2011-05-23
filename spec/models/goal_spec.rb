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
  end

  shared_examples_for 'goal :in_progress' do
    it "should have status :in_progress" do
       @it.status.should == :in_progress 
    end
  end

  shared_examples_for 'goal :for_review' do
    it "should have status :for_review" do
       @it.status.should == :for_review 
    end
  end

  shared_examples_for 'goal :fully_complete' do
    it "should have status :fully_complete" do
       @it.status.should == :fully_complete 
    end
  end
  
  context "with no tasks" do
    it_should_behave_like 'goal :not_started'

    context "and with goal set as complete" do
      before(:each) { @it.complete = true }
      it_should_behave_like 'goal :fully_complete'
    end
  end
  
  context "with one incomplete task" do
    before(:each) do
      Task.new.should respond_to(:complete?) # sanity check 
      @task1 = stub_model(Task, :complete? => false)
      @it.stub!(:tasks).and_return([@task1])
    end

    it_should_behave_like 'goal :in_progress'
    
    context "and with goal set as complete" do
      before(:each) { @it.complete = true }
      it_should_behave_like 'goal :fully_complete'
    end

    context "and one complete task" do
      before(:each) do
        @task2 = stub_model(Task, :complete? => true)
        @it.stub!(:tasks).and_return([@task1,@task2])
      end

      it_should_behave_like 'goal :in_progress'

      context "and with goal set as complete" do
        before(:each) { @it.complete = true }
        it_should_behave_like 'goal :fully_complete'
      end
    end
  end

  context "with one complete task" do
    before(:each) do
      @task1 = stub_model(Task, :complete? => true)
      @it.stub!(:tasks).and_return([@task1])
    end

    it_should_behave_like 'goal :for_review'
    
    context "and with goal set as complete" do
      before(:each) { @it.complete = true }
      it_should_behave_like 'goal :fully_complete'
    end
  end
  
end
