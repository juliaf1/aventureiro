class LocalFullPeriodPolicy < ApplicationPolicy

  def destroy?
    owner?
  end

  def create?
    owner?
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
