class PermitRequestsController < ApplicationController
  
  def index
    @permit_requests = PermitRequest.where(user_id: current_user.id)
  end

  def new
    @permit_request = PermitRequest.new
    authorize @permit_request
  end

  def create
    @permit_request = PermitRequest.new(permit_params)
    @permit_request.user = current_user
    @permit_request.status = 0
    authorize @permit_request
    if @permit_request.save
      redirect_to permit_requests_path, notice: "Your permit request has been completed, please await confirmation"
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:permit_request).permit(:arrival, :departure, :first_name, :last_name, :email, :address, :phone_number, :birth_date)
  end

end
