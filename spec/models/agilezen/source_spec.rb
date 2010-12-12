require 'spec_helper'

describe Agilezen::Source do
  before(:each) do
    @valid_attributes = {
      :api_key => "value for api_key",
      :project => 1,
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Agilezen::Source.create!(@valid_attributes)
  end
end
