class AddGoalIdToFeature < ActiveRecord::Migration
  def self.up
    add_column :features, :goal_id, :integer
  end

  def self.down
    remove_column :features, :goal_id
  end
end
