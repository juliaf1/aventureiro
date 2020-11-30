class UsersController < ApplicationController

  def edit
  end

  def update

    if current_user.update(user_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :birth_date, :address, :bio)
  end
end
