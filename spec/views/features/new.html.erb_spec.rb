require 'spec_helper'

describe "/features/new.html.erb" do
  include FeaturesHelper

  before(:each) do
    assigns[:feature] = stub_model(Feature,
      :new_record? => true,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders new feature form" do
    render

    response.should have_tag("form[action=?][method=post]", features_path) do
      with_tag("input#feature_name[name=?]", "feature[name]")
      with_tag("input#feature_detail[name=?]", "feature[detail]")
      with_tag("input#feature_complete[name=?]", "feature[complete]")
    end
  end
end
