require 'spec_helper'

describe "/tasks/new.html.erb" do
  include TasksHelper

  before(:each) do
    assigns[:task] = stub_model(Task,
      :new_record? => true,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders new task form" do
    render

    response.should have_tag("form[action=?][method=post]", tasks_path) do
      with_tag("input#task_name[name=?]", "task[name]")
      with_tag("textarea#task_detail[name=?]", "task[detail]")
      with_tag("input#task_complete[name=?]", "task[complete]")
    end
  end
end
