require 'spec_helper'

describe "/activities/_small_card.html.erb" do
  include ActivitiesHelper
  before(:each) do
    @activity = stub_model(Activity,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
    template.stub!(:activity).and_return(@activity)
  end

  it "renders attributes" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/In\ Progress/)
  end
end
