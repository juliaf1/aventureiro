class LocalCampsiteReservationPolicy < ApplicationPolicy

  def index?
    local?
  end

  def update?
    owner?
  end

  def local?
    user.local
  end

  def owner?
    record.campsite.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
