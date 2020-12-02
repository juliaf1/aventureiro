class UserPolicy < ApplicationPolicy

  def new?
    create?
  end
  
  def create?
    owner?
  end

  def show?
    owner?
  end

  def update?
    owner?
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
