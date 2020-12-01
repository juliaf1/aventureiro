class LocalBoatJourneyPolicy < ApplicationPolicy

  def index?
    local?
  end

  def destroy?
    owner?
  end

  def update?
    owner?
  end

  def create?
    local?
  end

  def owner?
    record.boat.user == user
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
