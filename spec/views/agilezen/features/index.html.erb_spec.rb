require 'spec_helper'

describe "/agilezen/features/index.html.erb" do
  include Agilezen::FeaturesHelper

  before(:each) do
    assigns[:agilezen_features] = [
      stub_model(Agilezen::Feature,
        :external_id => "value for external_id"
      ),
      stub_model(Agilezen::Feature,
        :external_id => "value for external_id"
      )
    ]
  end

  it "renders a list of agilezen_features" do
    render
    response.should have_tag("tr>td", "value for external_id".to_s, 2)
  end
end
