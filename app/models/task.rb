class Task < ActiveRecord::Base
  belongs_to :goal

  def status
    complete ? :fully_complete : :in_progress
  end
end
