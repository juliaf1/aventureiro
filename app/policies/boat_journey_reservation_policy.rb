class BoatJourneyReservationPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    owner?
  end

  def owner?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
