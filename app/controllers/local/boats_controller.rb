class Local::BoatsController < ApplicationController

  def index
    @boats = Boat.all
    authorize @boats, policy_class: LocalBoatPolicy
  end

  def new
    @boat = Boat.new
    authorize @boat, policy_class: LocalBoatPolicy
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat, policy_class: LocalBoatPolicy
    if @boat.save
      redirect_to local_boats_path
    else
      render :new
    end
  end

  def edit
    authorize
  end

  def update
    
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :max_occupation)
  end

  def find_boat
    @boat = Boat.find(params[:id])
  end

end
