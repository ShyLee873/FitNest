class UserPolicy < ApplicationPolicy

  def index?
    user == user.moderator_role? || user.admin_role?
  end

  def show?
    user == record || user.admin_role?
  end

  def new?
    create?
  end

  def create?
    user.admin_role?
  end
  
  def update?
    user == record || user.admin_role?
  end
  
  def destroy?
    user.admin_role?
  end

  def edit?
    user == record || user.admin_role?
  end



end