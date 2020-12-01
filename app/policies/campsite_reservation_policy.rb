class CampsiteReservationPolicy < ApplicationPolicy
  def index?
    owner?
  end

  def new?
    create?
  end

  def create?
    if user.local
      false
    else
      user
    end
  end

  def owner?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
