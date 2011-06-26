require 'spec_helper'

describe "/activities/index.html.erb" do
  include ActivitiesHelper

  describe "with some activities" do
    before(:each) do
      assigns[:activities] = [
        stub_model(Activity,
          :name => "value for name",
          :detail => "value for detail",
          :complete => false
        ),
        stub_model(Activity,
          :name => "value for another name",
          :detail => "value for different detail",
          :complete => true
        )
      ]
    end

    it "renders a list of activities" do
      render
      response.should have_text(/value\ for\ name/)
      response.should have_text(/value\ for\ another\ name/)
    end
  end

  describe "with no activities" do
    before(:each) do
      assigns[:activities] = []
    end

    it "links to new" do
      render
      response.should have_tag('a[href=?]',new_activity_path)
    end
  end

end
