class UsersController < ApplicationController

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
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%").page(params[:page]).reverse_order
    else
      @users = User.none
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
