module GoalsHelper
  def status_text(goal)
    goal.status.to_s.titleize
  end
end
