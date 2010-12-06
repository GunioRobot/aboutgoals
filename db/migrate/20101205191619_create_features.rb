class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name, :string, :limit => 100, :null => false
      t.string :detail, :string, :limit => 1000, :default => ''
      t.boolean :complete, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
