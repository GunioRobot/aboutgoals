require 'spec_helper'

describe "/goals/show.html.erb" do
  include GoalsHelper
  before(:each) do
    assigns[:goal] = @goal = stub_model(Goal,
      :name => "value for name",
      :detail => "value for detail",
      :complete => false
     )
  end

  it "renders attributes" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ detail/)
    response.should have_text(/Not Started/)
  end

  describe "with some activities" do
    before(:each) do
      assigns[:activities] = [
        stub_model(Activity,
          :name => "value for activity name",
          :complete => false
        ),
        stub_model(Activity,
          :name => "value for another activity name",
          :complete => true
        )
      ]
    end

    it "renders a list of activities" do
      render
      response.should have_text(/value\ for\ activity\ name/)
      response.should have_text(/value\ for\ another\ activity\ name/)
    end
  end

  describe "with no activities" do
    before(:each) do
      assigns[:activities] = []
    end

    it "links to new" do
      render
      response.should have_tag('a[href=?]',new_activity_goal_path(@goal))
    end
  end
end
