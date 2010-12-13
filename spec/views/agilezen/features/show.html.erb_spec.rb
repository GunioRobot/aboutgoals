require 'spec_helper'

describe "/agilezen/features/show.html.erb" do
  include Agilezen::FeaturesHelper
  before(:each) do
    assigns[:agilezen_feature] = @agilezen_feature = stub_model(Agilezen::Feature,
      :external_id => "value for external_id"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ external_id/)
  end
end
