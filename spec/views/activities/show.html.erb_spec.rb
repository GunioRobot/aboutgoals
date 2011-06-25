require 'spec_helper'

describe "/activities/show.html.erb" do
  include ActivitiesHelper
  before(:each) do
    assigns[:activity] = @activity = stub_model(Activity,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ detail/)
    response.should have_text(/In\ Progress/)
  end
end
