require 'spec_helper'

describe "/agilezen/activities/show.html.erb" do
  include Agilezen::ActivitiesHelper
  before(:each) do
    assigns[:agilezen_activity] = @agilezen_activity = stub_model(Agilezen::Activity,
      :external_id => "value for external_id"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ external_id/)
  end
end
