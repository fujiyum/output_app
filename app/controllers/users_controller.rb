class UsersController < ApplicationController
  def show
    @user = User.find(paramus[:id])
    @titles = @user.titles
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).parmit(:name, :profile_image)
  end

end
