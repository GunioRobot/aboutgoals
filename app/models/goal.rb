class Goal < ActiveRecord::Base
  has_many :activities
  
  def status
    return :fully_complete if self.complete?
    if self.activities.any?
      return :in_progress if self.activities.detect{ |f| !f.complete? }
      return :for_review
    end 
    return :not_started
  end

  def incomplete_activities
    activities.reject(&:complete)
  end
  
end
