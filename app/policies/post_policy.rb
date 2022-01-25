class PostPolicy < ApplicationPolicy

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
    user.present?
  end
  
  def edit?
    update?
  end

  def update?
    user.admin_role? || user.moderator_role? || user.author?(record)
    # user.author?(record)
  end
  
  def destroy?
    user.admin_role? || user.author?(record)
  end

end