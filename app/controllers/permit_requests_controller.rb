class PermitRequestsController < ApplicationController
  

  def index
  end

  def new
    @permit_request = PermitRequest.new
  end

  def create
    @permit_request = PermitRequest.new(permit_params)
    @permit_request.user = current_user
    if @permit_request.save
      redirect_to campsites_path
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:permit_request).permit(:arrival, :departure)
  end

end
