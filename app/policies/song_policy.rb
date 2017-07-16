class SongPolicy < ApplicationPolicy
  def new?
    user.artist?
  end

  def create?
    user.artist?
  end

  def show?
    user
  end

  def destroy?
    user.artist?
  end
end
