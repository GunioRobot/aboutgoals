class Agilezen::Task < ActiveRecord::Base
  set_table_name :agilezen_tasks
  
  belongs_to :source, :class_name => 'Agilezen::Source'
  
end
