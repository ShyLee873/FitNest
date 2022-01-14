class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end
  
  def update?
  end
  
  def destroy?
  end

  def edit?
    true
  end



end