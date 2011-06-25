class RenameTasksToActivities < ActiveRecord::Migration
  def self.up
    rename_table :tasks, :activities
  end

  def self.down
    rename_table :activities, :tasks
  end
end
