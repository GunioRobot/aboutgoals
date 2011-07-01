class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.xml
  def index
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])
    @goals = [@activity.goal].compact  # in case of nil

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/expanded
  # GET /activities/1/expanded.xml
  def expanded
    @activity = Activity.find(params[:id])
    @parents = [@activity.goal]

    respond_to do |format|
      format.html # expanded.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully created.'
        format.html { redirect_to(@activity) }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        flash[:notice] = 'Activity was successfully updated.'
        format.html { redirect_to(@activity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(activities_url) }
      format.xml  { head :ok }
    end
  end
  #
  # GET /activities/1/new_goal
  # GET /activities/1/new_goal.xml
  def new_goal
    @activity = Activity.find(params[:id])

    @goal = @activity.build_goal

    respond_to do |format|
      format.html # new_goal.html.erb
      format.xml  { render :xml => @activity }
    end
  end
  #
  # POST /activities/1/create_goal
  # POST /activities/1/create_goal.xml
  def create_goal
    @activity = Activity.find(params[:id])

    @goal = @activity.build_goal(params[:goal])
    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Goal was successfully created.'
        format.html { redirect_to(@activity) }
        format.xml  { render :xml => @goal, :status => :created, :location => @activity }
      else
        format.html { render :action => "new_goal" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

end
