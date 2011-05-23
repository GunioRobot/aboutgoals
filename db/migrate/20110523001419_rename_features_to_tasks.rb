class RenameFeaturesToTasks < ActiveRecord::Migration
  def self.up
    rename_table :features, :tasks
  end

  def self.down
    rename_table :tasks, :features
  end
end
