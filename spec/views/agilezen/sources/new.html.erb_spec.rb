require 'spec_helper'

describe "/agilezen/sources/new.html.erb" do
  include Agilezen::SourcesHelper

  before(:each) do
    assigns[:agilezen_source] = stub_model(Agilezen::Source,
      :new_record? => true,
      :api_key => "value for api_key",
      :project => 1,
      :name => "value for name"
    )
  end

  it "renders new source form" do
    render

    response.should have_tag("form[action=?][method=post]", agilezen_sources_path) do
      with_tag("input#agilezen_source_api_key[name=?]", "agilezen_source[api_key]")
      with_tag("input#agilezen_source_project[name=?]", "agilezen_source[project]")
      with_tag("input#agilezen_source_name[name=?]", "agilezen_source[name]")
    end
  end
end
