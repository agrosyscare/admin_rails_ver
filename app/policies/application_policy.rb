class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.super_admin? || @user.roles.action(:read).resource(@record.model_name).any?
  end

  def datatable?
    index?
  end

  def show?
    index?
  end

  def create?
    @user.super_admin? || @user.roles.action(:create).resource(@record.model_name).any?
  end

  def new?
    create?
  end

  def update?
    @user.super_admin? || @user.roles.action(:update).resource(@record.model_name).any?
  end

  def edit?
    update?
  end

  def destroy?
    @user.super_admin? || @user.roles.action(:destroy).resource(@record.model_name).any?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
