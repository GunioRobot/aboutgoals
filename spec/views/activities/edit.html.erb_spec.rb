require 'spec_helper'

describe "/activities/edit.html.erb" do
  include ActivitiesHelper

  before(:each) do
    assigns[:activity] = @activity = stub_model(Activity,
      :new_record? => false,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders the edit activity form" do
    render

    response.should have_tag("form[action=#{activity_path(@activity)}][method=post]") do
      with_tag('input#activity_name[name=?]', "activity[name]")
      with_tag('textarea#activity_detail[name=?]', "activity[detail]")
      with_tag('input#activity_complete[name=?]', "activity[complete]")
    end
  end

  it "should allow goal to be selected" do
    render
    response.should have_tag('select[name=?]','activity[goal_id]')
  end

end
