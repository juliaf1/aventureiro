class LocalCampsitePolicy < ApplicationPolicy

  # write the policies for the locals campsites controller here

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
