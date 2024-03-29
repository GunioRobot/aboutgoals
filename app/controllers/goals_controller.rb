class GoalsController < ApplicationController
  # GET /goals
  # GET /goals.xml
  def index
    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/summary
  # GET /goals/summary.xml
  def summary
    @goals = Goal.all
    @goals_not_started = Goal.find_all_not_started
    @goals_in_progress = Goal.find_all_in_progress
    @goals_for_review  = Goal.find_all_for_review
    @goals_complete    = Goal.find_all_complete

    respond_to do |format|
      format.html # summary.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.xml
  def show
    @goal = Goal.find(params[:id])
    @activities = @goal.activities if @goal

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/1/expanded
  # GET /goals/1/expanded.xml
  def expanded
    @goal = Goal.find(params[:id])
    @children = @goal.activities

    respond_to do |format|
      format.html # expanded.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.xml
  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.xml
  def create
    @goal = Goal.new(params[:goal])

    respond_to do |format|
      if @goal.save
        flash[:notice] = 'Goal was successfully created.'
        format.html { redirect_to(@goal) }
        format.xml  { render :xml => @goal, :status => :created, :location => @goal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.xml
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        flash[:notice] = 'Goal was successfully updated.'
        format.html { redirect_to(@goal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.xml
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to(goals_url) }
      format.xml  { head :ok }
    end
  end

  # GET /goals/1/new_activity
  # GET /goals/1/new_activity.xml
  def new_activity
    @goal = Goal.find(params[:id])

    @activity = @goal.activities.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/1/create_activity
  # GET /goals/1/create_activity.xml
  def create_activity
    @goal = Goal.find(params[:id])

    @activity = @goal.activities.new(params[:activity])
    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully created.'
        format.html { redirect_to(@goal) }
        format.xml  { render :xml => @activity, :status => :created, :location => @goal }
      else
        format.html { render :action => "new_activity" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

end
