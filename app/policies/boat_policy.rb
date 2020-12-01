class BoatPolicy < ApplicationPolicy

  def update?
    record.user == user
  end

  def create?
    user
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
