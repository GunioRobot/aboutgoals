require 'spec_helper'

describe Goal do
  before(:each) do
    @valid_attributes = {
      :name => 'some short name'
    }
  end

  it "should create a new instance given valid attributes" do
    Goal.create!(@valid_attributes)
  end
end
