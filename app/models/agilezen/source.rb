class Agilezen::Source < ActiveRecord::Base
  set_table_name :agilezen_sources
  
  has_many :features, :class_name => 'Agilezen::Feature', :foreign_key => :source_id
  
end
