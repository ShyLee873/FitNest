class GroupPolicy < ApplicationPolicy

  def index?
    true
  end

  def new?
    create?
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    update?
  end
  
  def update?
    user.admin_role? || user.moderator_role?
  end
  
  def destroy?
    user.admin_role? || user.moderator_role?
  end

  def home?
  end


end