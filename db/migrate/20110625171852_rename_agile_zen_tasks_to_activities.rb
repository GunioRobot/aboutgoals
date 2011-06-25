class RenameAgileZenTasksToActivities < ActiveRecord::Migration
  def self.up
    rename_table :agilezen_tasks, :agilezen_activities
  end

  def self.down
    rename_table :agilezen_activities, :agilezen_tasks
  end
end
