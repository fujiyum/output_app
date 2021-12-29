class InputsController < ApplicationController
  def new
    @input = Input.new
  end

  def create
    @input = Input.new(input_params)
    @input.save
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end
  
  private
  
  def input_params
    params.require(:input).permit(:title_id, :input, :terget)
    
  
end
