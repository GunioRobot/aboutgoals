require 'spec_helper'

describe "/activities/new.html.erb" do
  include ActivitiesHelper

  before(:each) do
    assigns[:activity] = stub_model(Activity,
      :new_record? => true,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders new activity form" do
    render

    response.should have_tag("form[action=?][method=post]", activities_path) do
      with_tag("input#activity_name[name=?]", "activity[name]")
      with_tag("textarea#activity_detail[name=?]", "activity[detail]")
      with_tag("input#activity_complete[name=?]", "activity[complete]")
    end
  end
end
