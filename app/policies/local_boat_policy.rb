class LocalBoatPolicy < ApplicationPolicy

  def create?
    local?
  end

  def index?
    true
  end

  def show?
    owner?
  end

  def local?
    user.local
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
