class LocalCampsiteReservationPolicy < ApplicationPolicy

  def index?
    true
  end

  def update?
    owner?
  end

  def local?
    record.campsite.user.local
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
