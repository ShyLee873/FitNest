class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    false
  end
  
  def update?
  end
  
  def destroy?
    true
  end

  def edit?
    true
  end



end