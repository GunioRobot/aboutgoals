require File.dirname(__FILE__) + '/../spec_helper'

describe Activity do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    }
    @it = Activity.create!(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    Activity.create!(@valid_attributes)
  end

  describe :status do
    context "when activity is complete" do
      before(:each) { @it.complete = true }
      it "should have status :fully_complete" do
        @it.status.should == :fully_complete
      end
    end

   context "when activity is not complete" do
      before(:each) { @it.complete = false }
      it "should have status :in_progress" do
        @it.status.should == :in_progress
      end
    end
  end

end
