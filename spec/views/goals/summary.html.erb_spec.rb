require 'spec_helper'

describe "/goals/summary.html.erb" do
  include GoalsHelper

  before(:each) do
    assigns[:goals] = [
      stub_model(Goal),
      stub_model(Goal)
    ]
  end

  it "renders a list of goals" do
    render
  end
end
