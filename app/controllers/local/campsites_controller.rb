class Local::CampsitesController < ApplicationController
  before_action :find_campsite, only: [ :edit, :update ]

  def index
    authorize_campsite
    @campsites = current_user.campsites
  end

  def edit
    authorize_campsite
  end

  def update
    authorize_campsite
    if @campsite.update(campsite_params)
      redirect_to local_campsites_path, notice: "Your campsite has been updated!"
    else
      render :edit
    end
  end

  private

  def authorize_campsite
    authorize @campsite, policy_class: LocalCampsitePolicy
  end

  def campsite_params
    params.require(:campsite).permit(:name, :description, :daily_price, :availability, :photo)
  end

  def find_campsite
    @campsite = Campsite.find(params[:id])
  end
end
