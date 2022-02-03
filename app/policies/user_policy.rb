class UserPolicy < ApplicationPolicy

  def index?
    true
    #user == user.moderator_role? || user.admin_role?
  end

  def show?
    true
    #user == record || user.admin_role?
  end

  def new?
    create?
  end

  def create?
    true
    #user.admin_role?
  end
  
  def update?
    true
    #user == record || user.admin_role?
  end
  
  def destroy?
    true
    #user.admin_role?
  end

  def edit?
    true
    #user == record || user.admin_role?
  end



end