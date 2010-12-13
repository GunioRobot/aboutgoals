class Agilezen::FeaturesController < ApplicationController
  # GET /agilezen_features
  # GET /agilezen_features.xml
  def index
    @agilezen_features = Agilezen::Feature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agilezen_features }
    end
  end

  # GET /agilezen_features/1
  # GET /agilezen_features/1.xml
  def show
    @agilezen_feature = Agilezen::Feature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agilezen_feature }
    end
  end


  # DELETE /agilezen_features/1
  # DELETE /agilezen_features/1.xml
  def destroy
    @agilezen_feature = Agilezen::Feature.find(params[:id])
    @agilezen_feature.destroy

    respond_to do |format|
      format.html { redirect_to(agilezen_features_url) }
      format.xml  { head :ok }
    end
  end
end
