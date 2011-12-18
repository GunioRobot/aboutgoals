class Agilezen::Activity < ActiveRecord::Base
  set_table_name :agilezen_activities

  belongs_to :source, :class_name => 'Agilezen::Source'

end
