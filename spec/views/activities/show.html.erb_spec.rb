require 'spec_helper'

describe "/activities/show.html.erb" do
  include ActivitiesHelper
  before(:each) do
    assigns[:activity] = @activity = stub_model(Activity,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
    )
  end

  it "renders attributes" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ detail/)
    response.should have_text(/In\ Progress/)
  end

  describe "with some goals" do
    before(:each) do
      assigns[:goals] = [
        stub_model(Goal,
          :name => "value for goal name",
          :complete => false
        )
      ]
    end

    it "renders a list of goals" do
      render
      response.should have_text(/value\ for\ goal\ name/)
    end
  end

  describe "with no goals" do
    before(:each) do
      assigns[:goals] = []
    end

    it "links to new" do
      render
      response.should have_tag('a[href=?]',new_goal_activity_path(@activity))
    end
  end
end
