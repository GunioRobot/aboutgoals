class Agilezen::TasksController < ApplicationController
  # GET /agilezen_tasks
  # GET /agilezen_tasks.xml
  def index
    @agilezen_tasks = Agilezen::Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agilezen_tasks }
    end
  end

  # GET /agilezen_tasks/1
  # GET /agilezen_tasks/1.xml
  def show
    @agilezen_task = Agilezen::Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agilezen_task }
    end
  end


  # DELETE /agilezen_tasks/1
  # DELETE /agilezen_tasks/1.xml
  def destroy
    @agilezen_task = Agilezen::Task.find(params[:id])
    @agilezen_task.destroy

    respond_to do |format|
      format.html { redirect_to(agilezen_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
