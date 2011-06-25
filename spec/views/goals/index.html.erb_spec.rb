require 'spec_helper'

describe "/goals/index.html.erb" do
  include GoalsHelper

  before(:each) do
    assigns[:goals] = [
      stub_model(Goal, 
        :name => "value for name",
        :detail => "value for detail",
        :complete => false
                ),
      stub_model(Goal, 
        :name => "value for another name",
        :detail => "value for different detail",
        :complete => true
                )
    ]
  end

  it "renders a list of goals" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ another\ name/)
  end
end
