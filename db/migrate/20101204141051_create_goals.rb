class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.column "name", :string, :limit => 100, :null => false
      t.column "detail", :string, :limit => 1000, :default => ''
      t.column "met", :boolean, :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end
