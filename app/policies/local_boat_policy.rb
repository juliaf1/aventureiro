class LocalBoatPolicy < ApplicationPolicy

  def destroy?
    owner?
  end

  def create?
    local?
  end

  def update?
    owner?
  end

  def index?
    local?
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
