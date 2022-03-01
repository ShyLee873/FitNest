class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.admin_role? || user.author?(record)
  end

  def new?
    create?
  end

  def create?
    if record.postable_type == "Group" 
      true
    else 
      user.author?(record)
    end
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