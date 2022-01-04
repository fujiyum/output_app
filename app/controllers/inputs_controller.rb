class InputsController < ApplicationController
  def new
    @title = Title.find(params[:title_id])
    @user = @title.user
    @input = Input.new
  end

  def create
    @input = Input.new(input_params)
    @input.save
    redirect_to inputs_path(title_id: @input.title_id)
  end

  def index
    @title = Title.find(params[:title_id])
    @user = @title.user
    @inputs = @title.inputs
  end

  def show
    @input = Input.find(params[:id])
    @title = @input.title
    @user = @title.user
    @outputs = @input.outputs
  end

  def edit
    @input = Input.find(params[:id])
    @title = @input.title
    @user = @title.user
  end

  def update
    @input = Input.find(params[:id])
    @input.update(input_params)
    redirect_to input_path(@input.id)
  end

  private

  def input_params
    params.require(:input).permit(:title_id, :input, :terget)
  end

end
