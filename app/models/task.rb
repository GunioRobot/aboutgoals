class Task < ActiveRecord::Base
  set_table_name :features

  belongs_to :goal
end
