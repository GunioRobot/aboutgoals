require 'spec_helper'

describe "/tasks/_small_card.html.erb" do
  include TasksHelper
  before(:each) do
    @task = stub_model(Task,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
    template.stub!(:task).and_return(@task)
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/In\ Progress/)
  end
end
