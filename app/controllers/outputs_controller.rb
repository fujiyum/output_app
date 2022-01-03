class OutputsController < ApplicationController
  def new
    @input = Input.find(params[:input_id])
    @title = @input.title
    @user = @title.user
    @output = Output.new
  end

  def create
    @output = Output.new(output_params)
    @output.save
    redirect_to input_path(@output.input.id)
  end

  def edit
    @output = Output.find(params[:id])
    @input = @output.input
    @title = @input.title
    @user = @title.user
  end

  def update
    output = Output.find(params[:id])
    output.update(output_params)
    redirect_to input_path(output.input.id)
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

end
