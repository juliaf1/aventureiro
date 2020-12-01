class LocalBoatJourneyPolicy < ApplicationPolicy

  def destroy?
    true
  end

  def update?
    true
  end

  def create?
    local?
  end

  def owner?
    Boat.where(user: current_user).include?(record.boat)
  end

  def local?
    user.local
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
