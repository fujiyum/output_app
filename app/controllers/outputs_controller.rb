class OutputsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user_new, only: [:new]
  before_action :correct_user_edit, only: [:edit]

  def new
    @input = Input.find(params[:input_id])
    @title = @input.title
    @user = @title.user
    @output = Output.new
  end

  def create
    @output = Output.new(output_params)
    if @output.save
      redirect_to input_path(@output.input.id)
    else
      @input = @output.input
      @title = @input.title
      @user = @title.user
      render :new
    end
  end

  def edit
    @output = Output.find(params[:id])
    @input = @output.input
    @title = @input.title
    @user = @title.user
  end

  def update
    @output = Output.find(params[:id])
    if @output.update(output_params)
      redirect_to input_path(@output.input.id)
    else
      @input = @output.input
      @title = @input.title
      @user = @title.user
      render :edit
    end
  end

  def destroy
    output = Output.find(params[:id])
    output.destroy
    redirect_to input_path(output.input.id)
  end

  private

  def output_params
    params.require(:output).permit(:input_id, :output, :feedback)
  end

  def correct_user_new
      input = Input.find(params[:input_id])
      title = input.title
      user = title.user
    if current_user != user
      redirect_to root_path
    end
  end

  def correct_user_edit
      output = Output.find(params[:id])
      input = output.input
      title = input.title
      user = title.user
    if current_user != user
      redirect_to root_path
    end
  end

end
