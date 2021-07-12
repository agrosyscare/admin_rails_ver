class ArduinoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.super_admin?
        super
      else
        scope.none
      end
    end
  end
end
