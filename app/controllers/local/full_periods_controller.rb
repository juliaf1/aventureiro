class Local::FullPeriodsController < ApplicationController
  before_action :find_full_period, only: [ :destroy ]
  before_action :find_campsite, only: [ :new, :create ]

  def new
    @full_period = FullPeriod.new
    authorize_full_period
  end

  def create
    @full_period = FullPeriod.new(full_period_params)
    @full_period.campsite = @campsite
    authorize_full_period
    if @full_period.save
      redirect_to local_campsites_path
    else
      render :new
    end
  end

  def destroy
    authorize_full_period
    @full_period.destroy
    redirect_to local_campsites_path
  end

  private
  
  def full_period_params
    params.require(:full_period).permit(:start_date, :end_date)
  end

  def find_full_period
    @full_period = FullPeriod.find(params[:id])
  end

  def find_campsite
    @campsite = Campsite.find(params[:campsite_id])
  end

  def authorize_full_period
    authorize @full_period, policy_class: LocalFullPeriodPolicy
  end
end