require 'spec_helper'

describe "/goals/_small_card.html.erb" do
  include GoalsHelper
  before(:each) do
    assigns[:goal] = @goal = stub_model(Goal,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
    template.stub!(:goal).and_return(@goal)
  end

  it "renders attributes" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/Not\ Started/)
  end
end
