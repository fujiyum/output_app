class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[search show]
  before_action :correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @titles = @user.titles.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def search
    @users = if params[:name].present?
               User.where('name LIKE ?', "%#{params[:name]}%").page(params[:page]).reverse_order
             else
               User.none
             end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

  def correct_user
      user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end

end
