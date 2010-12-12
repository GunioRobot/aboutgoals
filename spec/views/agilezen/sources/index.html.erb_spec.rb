require 'spec_helper'

describe "/agilezen/sources/index.html.erb" do
  include Agilezen::SourcesHelper

  before(:each) do
    assigns[:agilezen_sources] = [
      stub_model(Agilezen::Source,
        :api_key => "value for api_key",
        :project => 1,
        :name => "value for name"
      ),
      stub_model(Agilezen::Source,
        :api_key => "value for api_key",
        :project => 1,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of agilezen_sources" do
    render
    response.should have_tag("tr>td", "value for api_key".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
