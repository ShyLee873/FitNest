class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end
  
  def update?
    false
    # user.author?(record)
  end
  
  def destroy?
  end

end