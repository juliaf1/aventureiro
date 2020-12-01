class CampsitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  # skip_after_action :verify_authorized, only: [ :show ]

  def index
    @campsites = Campsite.all
  end

  def show
    @campsite = Campsite.find(params[:id])
  end
end
