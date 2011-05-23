require 'spec_helper'

describe "/agilezen/tasks/show.html.erb" do
  include Agilezen::TasksHelper
  before(:each) do
    assigns[:agilezen_task] = @agilezen_task = stub_model(Agilezen::Task,
      :external_id => "value for external_id"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ external_id/)
  end
end
