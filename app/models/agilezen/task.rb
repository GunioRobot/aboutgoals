class Agilezen::Task < ActiveRecord::Base
  set_table_name :agilezen_features
  
  belongs_to :source, :class_name => 'Agilezen::Source'
  
end
