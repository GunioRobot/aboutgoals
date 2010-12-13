class CreateAgilezenFeatures < ActiveRecord::Migration
  def self.up
    create_table :agilezen_features do |t|
      t.string :external_id

      t.timestamps
    end
  end

  def self.down
    drop_table :agilezen_features
  end
end
