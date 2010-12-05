require 'spec_helper'

describe "/features/show.html.erb" do
  include FeaturesHelper
  before(:each) do
    assigns[:feature] = @feature = stub_model(Feature,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ detail/)
    response.should have_text(/false/)
  end
end
