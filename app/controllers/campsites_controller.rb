class CampsitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @campsites = Campsite.includes(:user)
    authorize @campsites
    
    if params[:start_date]
      get_dates
      @campsites = @campsites.select do |campsite|
        confirm_check_in(campsite) && confirm_check_out(campsite) && confirm_straddle(campsite)
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

  def confirm_straddle(campsite)
    !campsite.full_periods.any? do |period|
      @start_date < period.start_date && period.end_date < @end_date
    end
  end

  def get_dates
    @start_date = params[:start_date].split('to').first.to_date
    @end_date = params[:end_date].to_date
  end
end
