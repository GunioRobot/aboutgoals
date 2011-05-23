require File.dirname(__FILE__) + '/../spec_helper'

describe Task do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    }
  end

  it "should create a new instance given valid attributes" do
    Task.create!(@valid_attributes)
  end
end
