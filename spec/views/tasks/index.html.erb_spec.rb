require 'spec_helper'

describe "/tasks/index.html.erb" do
  include TasksHelper

  before(:each) do
    assigns[:tasks] = [
      stub_model(Task,
        :name => "value for name",
        :detail => "value for detail",
        :complete => false
      ),
      stub_model(Task,
        :name => "value for another name",
        :detail => "value for different detail",
        :complete => true
      )
    ]
  end

  it "renders a list of tasks" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ another\ name/)
  end
end
