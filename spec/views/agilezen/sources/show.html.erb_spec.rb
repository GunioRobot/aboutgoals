require 'spec_helper'

describe "/agilezen/sources/show.html.erb" do
  include Agilezen::SourcesHelper
  before(:each) do
    assigns[:agilezen_source] = @agilezen_source = stub_model(Agilezen::Source,
      :api_key => "value for api_key",
      :project => 1,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ api_key/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
  end
end
