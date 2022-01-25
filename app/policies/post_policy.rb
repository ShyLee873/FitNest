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
    false
  end
  
  def update?
    true
    # user.author?(record)
  end
  
  def destroy?
  end

end