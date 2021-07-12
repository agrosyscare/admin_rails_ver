class GreenhousePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      super
    end

    def charts?
      @user.super_admin? || @user.roles.action(:charts).resource(@record.model_name).any?
    end
  end
end
