class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.super_admin? || user.is_manager?
        super
      else
        scope.where(id: user)
      end
    end
  end
end
