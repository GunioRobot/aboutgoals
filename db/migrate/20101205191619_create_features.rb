class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name
      t.string :detail
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
