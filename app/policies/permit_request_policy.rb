class PermitRequestPolicy < ApplicationPolicy

  def index
    !local?
  end

  def create?
    !local?
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
