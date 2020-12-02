class Local::BoatsController < ApplicationController
  before_action :find_boat, only: [ :edit, :update, :destroy ]

  def index
    @boats = current_user.boats
    authorize_boat
  end

  def new
    @boat = Boat.new
    authorize_boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize_boat
    if @boat.save
      redirect_to local_boats_path
    else
      render :new
    end
  end

  def edit
    authorize_boat
  end

  def update
    authorize_boat
    if @boat.update(boat_params)
      redirect_to local_boats_path, notice: "Your boat has been updated!"
    else
      render :edit
    end
  end

  def destroy
    authorize_boat
    @boat.destroy
    redirect_to local_boats_path
  end

  private

  def authorize_boat
    authorize @boat, policy_class: LocalBoatPolicy
  end

  def boat_params
    params.require(:boat).permit(:name, :max_occupation)
  end

  def find_boat
    @boat = Boat.find(params[:id])
  end

end
