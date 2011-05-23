require 'spec_helper'

describe "/agilezen/tasks/index.html.erb" do
  include Agilezen::TasksHelper

  before(:each) do
    assigns[:agilezen_tasks] = [
      stub_model(Agilezen::Task,
        :external_id => "value for external_id"
      ),
      stub_model(Agilezen::Task,
        :external_id => "value for external_id"
      )
    ]
  end

  it "renders a list of agilezen_tasks" do
    render
    response.should have_tag("tr>td", "value for external_id".to_s, 2)
  end
end
