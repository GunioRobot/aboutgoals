require 'spec_helper'

describe "/activities/new_goal.html.erb" do
  include ActivitiesHelper

  before(:each) do
    assigns[:goal] = stub_model(Goal,
      :new_record? => true,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
    assigns[:activity] = stub_model(Activity,
      :new_record? => false,
      :id => 345,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders new goal form" do
    render

    response.should have_tag("form[action=?][method=post]", create_goal_activity_path( assigns[:activity] ) ) do
      with_tag("input#goal_name[name=?]", "goal[name]")
      with_tag("textarea#goal_detail[name=?]", "goal[detail]")
      with_tag("input#goal_complete[name=?]", "goal[complete]")
    end
  end
end
