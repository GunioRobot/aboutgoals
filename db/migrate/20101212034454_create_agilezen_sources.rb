class CreateAgilezenSources < ActiveRecord::Migration
  def self.up
    create_table :agilezen_sources do |t|
      t.string :api_key
      t.integer :project
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :agilezen_sources
  end
end
