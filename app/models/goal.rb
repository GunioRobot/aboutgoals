class Goal < ActiveRecord::Base
  has_many :features
  
  def status
    return :fully_complete if self.complete?
    if self.features.any?
      return :in_progress if self.features.detect{ |f| !f.complete? }
      return :for_review
    end 
    return :not_started
  end
  
end
