class LocalBoatJourneyReservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    owner?
  end

  def owner?
    record.boat_journey.boat.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
