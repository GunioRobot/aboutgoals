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
        :name => "value for name",
        :detail => "value for detail",
        :complete => false
      )
    ]
  end

  it "renders a list of tasks" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for detail".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
