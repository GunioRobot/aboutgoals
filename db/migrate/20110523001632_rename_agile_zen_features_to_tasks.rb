class RenameAgileZenFeaturesToTasks < ActiveRecord::Migration
  def self.up
    rename_table :agilezen_features, :agilezen_tasks
  end

  def self.down
    rename_table :agilezen_tasks, :agilezen_features
  end
end
