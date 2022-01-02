class InputsController < ApplicationController
  def new
    @title = Title.find(params[:title_id])
    @input = Input.new
  end

  def create
    @input = Input.new(input_params)
    @input.save
    redirect_to inputs_path(title_id: @input.title_id)
  end

  def index
    @title = Title.find(params[:title_id])
    @inputs = @title.inputs
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
