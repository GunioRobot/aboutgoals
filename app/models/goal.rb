class Goal < ActiveRecord::Base
  has_many :activities
  
  # returns one of 4 statuses for the goal
  # :not_started - goal is not marked as complete and there are no tasks
  # :in_progress - goal is not marked as complete, activities exist but some are not complete
  # :for_review - goal is not marked as complete but all activities are complete
  # :fully_complete - goal is marked complete
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

  def self.find_all_not_started
    find(:all, :conditions =>  { :complete => false }, :include => :activities).select{ |g| g.activities.none? }
  end
  
  def self.find_all_in_progress
    find(:all, :conditions =>  { :complete => false }, :include => :activities).select{ |g| g.activities.any? && g.incomplete_activities.any? }
  end

  def self.find_all_for_review  
    find(:all, :conditions =>  { :complete => false }, :include => :activities).select{ |g| g.activities.any? && g.incomplete_activities.none? }
  end
end
