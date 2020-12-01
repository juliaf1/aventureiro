class CampsiteReservationPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.user != user
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
