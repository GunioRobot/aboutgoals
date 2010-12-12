class Agilezen::SourcesController < ApplicationController
  # GET /agilezen_sources
  # GET /agilezen_sources.xml
  def index
    @agilezen_sources = Agilezen::Source.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agilezen_sources }
    end
  end

  # GET /agilezen_sources/1
  # GET /agilezen_sources/1.xml
  def show
    @agilezen_source = Agilezen::Source.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agilezen_source }
    end
  end

  # GET /agilezen_sources/new
  # GET /agilezen_sources/new.xml
  def new
    @agilezen_source = Agilezen::Source.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agilezen_source }
    end
  end

  # GET /agilezen_sources/1/edit
  def edit
    @agilezen_source = Agilezen::Source.find(params[:id])
  end

  # POST /agilezen_sources
  # POST /agilezen_sources.xml
  def create
    @agilezen_source = Agilezen::Source.new(params[:agilezen_source])

    respond_to do |format|
      if @agilezen_source.save
        flash[:notice] = 'Agilezen::Source was successfully created.'
        format.html { redirect_to(@agilezen_source) }
        format.xml  { render :xml => @agilezen_source, :status => :created, :location => @agilezen_source }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agilezen_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agilezen_sources/1
  # PUT /agilezen_sources/1.xml
  def update
    @agilezen_source = Agilezen::Source.find(params[:id])

    respond_to do |format|
      if @agilezen_source.update_attributes(params[:agilezen_source])
        flash[:notice] = 'Agilezen::Source was successfully updated.'
        format.html { redirect_to(@agilezen_source) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agilezen_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agilezen_sources/1
  # DELETE /agilezen_sources/1.xml
  def destroy
    @agilezen_source = Agilezen::Source.find(params[:id])
    @agilezen_source.destroy

    respond_to do |format|
      format.html { redirect_to(agilezen_sources_url) }
      format.xml  { head :ok }
    end
  end
end
