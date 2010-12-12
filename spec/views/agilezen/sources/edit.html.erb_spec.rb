require 'spec_helper'

describe "/agilezen/sources/edit.html.erb" do
  include Agilezen::SourcesHelper

  before(:each) do
    assigns[:agilezen_source] = @agilezen_source = stub_model(Agilezen::Source,
      :new_record? => false,
      :api_key => "value for api_key",
      :project => 1,
      :name => "value for name"
    )
  end

  it "renders the edit source form" do
    render

    response.should have_tag("form[action=#{agilezen_source_path(@agilezen_source)}][method=post]") do
      with_tag('input#agilezen_source_api_key[name=?]', "agilezen_source[api_key]")
      with_tag('input#agilezen_source_project[name=?]', "agilezen_source[project]")
      with_tag('input#agilezen_source_name[name=?]', "agilezen_source[name]")
    end
  end
end
