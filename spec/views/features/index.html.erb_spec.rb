require 'spec_helper'

describe "/features/index.html.erb" do
  include FeaturesHelper

  before(:each) do
    assigns[:features] = [
      stub_model(Feature,
        :name => "value for name",
        :detail => "value for detail",
        :complete => false
      ),
      stub_model(Feature,
        :name => "value for name",
        :detail => "value for detail",
        :complete => false
      )
    ]
  end

  it "renders a list of features" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for detail".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
