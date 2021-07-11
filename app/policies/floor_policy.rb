class FloorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.super_admin? || user.is_manager?
        super
      else
        scope.none
      end
    end
  end
end
