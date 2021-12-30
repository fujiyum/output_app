class InputsController < ApplicationController
  def new
    @title = Title.find(params[:title_id])
    @input = Input.new
  end

  def create
    @title = Title.find(params[:title_id])
    @input = @title.input.new(input_params)
    @input.title_id = title.id
    @input.save
    redirect_to inputs_path
  end

  def index
    @title = Title.find(params[:title_id])
    @user = @title.user
    @inputs = @title.input.all
  end

  def show
    @title = Title.find(params[:title_id])
    @user = @title.user
    @input = @title.input.find(params[:id])
  end

  def edit
    @title = Title.find(params[:title_id])
    @user = @title.user
    @input = Input.find(params[:id])
  end

  def update
  end

  private

  def input_params
    params.require(:input).permit(:title_id, :input, :terget)
  end

end
