class AddSourceIdToAgilezenFeature < ActiveRecord::Migration
  def self.up
    add_column :agilezen_features, :source_id, :integer
  end

  def self.down
    remove_column :agilezen_features, :source_id
  end
end
