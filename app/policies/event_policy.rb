class EventPolicy < ApplicationPolicy

  def index?
    if @record.first
      !Membership.find_by(user_id: @user.id, group_id: @record.first.group_id).nil?
    else
      false
    end
  end

  def new?
    create?
  end

  def show?
    true
  end

  def create?
    user.admin_role? || user.moderator_role? || !Membership.find_by(user_id: @user.id, group_id: @record.group_id).nil?
  end

  def edit?
    user.admin_role? || user.moderator_role?
  end
  
  def update?
    edit?
  end
  
  def destroy?
    edit?
  end

end