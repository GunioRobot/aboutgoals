require 'spec_helper'

describe "/goals/summary.html.erb" do
  include GoalsHelper

  describe "with some goals" do
    before(:each) do
      assigns[:goals_not_started] = [
        stub_model(Goal, :name => "goal111")
      ]
      assigns[:goals_in_progress] = [
        stub_model(Goal, :name => "goal222")
      ]
      assigns[:goals_for_review] = [
        stub_model(Goal, :name => "goal333")
      ]
      assigns[:goals_complete] = [
        stub_model(Goal, :name => "goal444")
      ]
    end

    it "renders a list of goals" do
      render
      response.should have_text(/goal111/)
      response.should have_text(/goal222/)
      response.should have_text(/goal333/)
      response.should have_text(/goal444/)
    end
  end

  describe "with no goals" do
    before(:each) do
      assigns[:goals] = []
    end

    it "links to new" do
      render
      response.should have_tag('a[href=?]',new_goal_path)
    end
  end

end
