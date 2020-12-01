class BoatsController < ApplicationController

  def new
    @boat = Boat.new
    authorize current_user
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize current_user
    if @boat.save
      redirect_to current_user
    else
      render :new
    end
  end

  def edit
    @boat = current_user.boat
  end

  def update
    
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :max_occupation)
  end

end
