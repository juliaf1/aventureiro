class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if current_user.update(user_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :birth_date, :address, :bio)
  end
end
