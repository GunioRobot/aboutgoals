require 'spec_helper'

describe "/tasks/edit.html.erb" do
  include TasksHelper

  before(:each) do
    assigns[:task] = @task = stub_model(Task,
      :new_record? => false,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders the edit task form" do
    render

    response.should have_tag("form[action=#{task_path(@task)}][method=post]") do
      with_tag('input#task_name[name=?]', "task[name]")
      with_tag('textarea#task_detail[name=?]', "task[detail]")
      with_tag('input#task_complete[name=?]', "task[complete]")
    end
  end
  
  it "should allow goal to be selected" do
    render 
    response.should have_tag('select[name=?]','task[goal_id]')
  end
  
end
