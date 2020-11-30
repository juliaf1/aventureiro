class CampsitesController < ApplicationController
  def index
    @campsites = Campsite.all
  end

  def show
    @campsite = Campsite.find(params[:id])
  end
end
