class CampsitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @campsites = Campsite.includes(:user)
    authorize @campsites

    if params[:start_date]
      @start_date = params[:start_date].split('to').first.to_date
    end

    if params[:end_date]
      @end_date = params[:end_date].to_date
    end
    
    if @end_date
      @campsites = @campsites.select do |campsite|
        confirm_check_in(campsite) && confirm_check_out(campsite)
      end
    end

  end

  def show
    @campsite = Campsite.find(params[:id])
    authorize @campsite
  end

  private

  def confirm_check_in(campsite)
    campsite.full_periods.all? do |period|
      period.end_date < @start_date || period.start_date > @start_date
    end
  end

  def confirm_check_out(campsite)
    campsite.full_periods.all? do |period|
      period.end_date < @end_date || period.start_date > @end_date
    end
  end
end
