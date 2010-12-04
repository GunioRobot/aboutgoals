require 'spec_helper'

describe "/goals/new.html.erb" do
  include GoalsHelper

  before(:each) do
    assigns[:goal] = stub_model(Goal,
      :new_record? => true
    )
  end

  it "renders new goal form" do
    render

    response.should have_tag("form[action=?][method=post]", goals_path) do
    end
  end
end
