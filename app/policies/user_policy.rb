class UserPolicy < ApplicationPolicy
  def show?
    super || user.id == record.id
  end

  def edit?
    super || user.id == record.id
  end

  def destroy?
    return false if record.super_admin?
    super
  end

  def invitations?
    @user.super_admin? || @user.roles.action(:create).resource(@record.model_name).any?
  end
  class Scope < Scope
    def resolve
      if user.super_admin?
        super
      elsif user.is_manager?
        scope.where.not(id: User.first)
      else
        scope.where(id: user)
      end
    end
  end
end
