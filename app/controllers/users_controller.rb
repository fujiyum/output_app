class UsersController < ApplicationController
  def show
    @user = User.find(paramus[:id])
    @titles = @user.titles
  end

  def edit
  end

  def update
  end
end
