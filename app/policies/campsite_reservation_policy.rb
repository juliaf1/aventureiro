class CampsiteReservationPolicy < ApplicationPolicy

  def index?
    true
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

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
