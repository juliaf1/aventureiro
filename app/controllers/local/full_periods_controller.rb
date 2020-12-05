class Local::FullPeriodsController < ApplicationController
  before_action :find_full_period, only: [ :destroy ]

  def destroy
    @full_period.destroy
    redirect_to local_campsites_path
  end

  private

  def find_full_period
    @full_period = FullPeriod.find(params[:id])
  end
end