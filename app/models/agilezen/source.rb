class Agilezen::Source < ActiveRecord::Base
  set_table_name :agilezen_sources
  
  has_many :tasks, :class_name => 'Agilezen::Task', :foreign_key => :source_id
  
end
