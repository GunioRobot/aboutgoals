require 'spec_helper'

describe "/goals/edit.html.erb" do
  include GoalsHelper

  before(:each) do
    assigns[:goal] = @goal = stub_model(Goal,
      :new_record? => false
    )
  end

  it "renders the edit goal form" do
    render

    response.should have_tag("form[action=#{goal_path(@goal)}][method=post]") do
    end
  end
end
