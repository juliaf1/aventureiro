class LocalFullPeriodPolicy < ApplicationPolicy

  def new?
    local?
  end

  def destroy?
    owner?
  end

  def create?
    owner?
  end

  def owner?
    record.campsite.user == user
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
