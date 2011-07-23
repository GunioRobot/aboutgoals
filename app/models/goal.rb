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

  def self.find_all_with_no_activities
    find(:all, :include => :activities).select{ |g| g.activities.none? }
  end
  
  def self.find_all_in_progress
    find(:all, :include => :activities).select{ |g| g.activities.any? && g.incomplete_activities.any? }
  end

  def self.find_all_with_all_activities_complete  
    find(:all, :include => :activities).select{ |g| g.activities.any? && g.incomplete_activities.none? }
  end
end
