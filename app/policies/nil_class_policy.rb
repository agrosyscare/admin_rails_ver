class NilClassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      raise Pundit::NotDefinedError, "Cannot scope NilClass"
    end
  end

  def index?
    false
  end

  def datatable?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    false
  end

  def edit?
    false
  end

  def destroy?
    false
  end
end
