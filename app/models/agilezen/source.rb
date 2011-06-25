class Agilezen::Source < ActiveRecord::Base
  set_table_name :agilezen_sources
  
  has_many :activities, :class_name => 'Agilezen::Activity', :foreign_key => :source_id
  
end
