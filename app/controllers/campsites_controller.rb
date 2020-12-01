class CampsitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @campsites = Campsite.all
    authorize @campsites
  end

  def show
    @campsite = Campsite.find(params[:id])
    authorize @campsite
  end
end
