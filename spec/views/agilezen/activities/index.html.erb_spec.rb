require 'spec_helper'

describe "/agilezen/activities/index.html.erb" do
  include Agilezen::ActivitiesHelper

  before(:each) do
    assigns[:agilezen_activities] = [
      stub_model(Agilezen::Activity,
        :external_id => "value for external_id"
      ),
      stub_model(Agilezen::Activity,
        :external_id => "value for external_id"
      )
    ]
  end

  it "renders a list of agilezen_activities" do
    render
    response.should have_tag("tr>td", "value for external_id".to_s, 2)
  end
end
