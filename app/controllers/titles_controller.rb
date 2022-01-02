class TitlesController < ApplicationController
  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    @title.user_id = current_user.id
    @title.save
    redirect_to title_path(@title.id)
  end

  def show
    @title = Title.find(params[:id])
  end

  def edit
    @title = Title.find(params[:id])
  end

  def update
    title = Title.find(params[:id])
    title.update(title_params)
    redirect_to titles_path
  end

  def destroy
    title = Title.find(params[:id])
    title.destroy
    redirect_to titles_path
  end

  def index
    @titles = Title.all
  end

  private

  def title_params
    params.require(:title).permit(:user_id, :title_name, :image)
  end

end
