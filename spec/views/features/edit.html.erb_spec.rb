require 'spec_helper'

describe "/features/edit.html.erb" do
  include FeaturesHelper

  before(:each) do
    assigns[:feature] = @feature = stub_model(Feature,
      :new_record? => false,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders the edit feature form" do
    render

    response.should have_tag("form[action=#{feature_path(@feature)}][method=post]") do
      with_tag('input#feature_name[name=?]', "feature[name]")
      with_tag('textarea#feature_detail[name=?]', "feature[detail]")
      with_tag('input#feature_complete[name=?]', "feature[complete]")
    end
  end
end
