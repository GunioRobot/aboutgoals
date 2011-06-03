require 'spec_helper'

describe "/goals/expanded.html.erb" do
  include GoalsHelper
  before(:each) do
    assigns[:goal] = @goal = stub_model(Goal)
  end

  it "renders attributes in <p>" do
    render
  end
end
