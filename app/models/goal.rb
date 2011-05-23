class Goal < ActiveRecord::Base
  has_many :tasks
  
  def status
    return :fully_complete if self.complete?
    if self.tasks.any?
      return :in_progress if self.tasks.detect{ |f| !f.complete? }
      return :for_review
    end 
    return :not_started
  end
  
end
