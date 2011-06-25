class Agilezen::ActivitiesController < ApplicationController
  # GET /agilezen_activities
  # GET /agilezen_activities.xml
  def index
    @agilezen_activities = Agilezen::Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agilezen_activities }
    end
  end

  # GET /agilezen_activities/1
  # GET /agilezen_activities/1.xml
  def show
    @agilezen_activity = Agilezen::Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agilezen_activity }
    end
  end


  # DELETE /agilezen_activities/1
  # DELETE /agilezen_activities/1.xml
  def destroy
    @agilezen_activity = Agilezen::Activity.find(params[:id])
    @agilezen_activity.destroy

    respond_to do |format|
      format.html { redirect_to(agilezen_activities_url) }
      format.xml  { head :ok }
    end
  end
end
