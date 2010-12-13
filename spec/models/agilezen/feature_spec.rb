require 'spec_helper'

describe Agilezen::Feature do
  before(:each) do
    @valid_attributes = {
      :external_id => "value for external_id"
    }
  end

  it "should create a new instance given valid attributes" do
    Agilezen::Feature.create!(@valid_attributes)
  end
end
