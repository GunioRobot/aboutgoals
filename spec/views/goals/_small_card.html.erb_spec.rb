require 'spec_helper'

describe "/goals/_small.html.erb" do
  include GoalsHelper
  before(:each) do
    assigns[:goal] = @goal = stub_model(Goal,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders attributes in <p>" do
    render
  end
end
