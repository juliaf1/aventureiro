class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :edit, :update ]

  def show
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

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :birth_date, :address, :bio, :photo)
  end
end
