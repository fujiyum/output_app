class InputsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user_new ,only: [:new]
  before_action :correct_user_edit, only: [:edit]

  def new
    @title = Title.find(params[:title_id])
    @user = @title.user
    @input = Input.new
  end

  def create
    @input = Input.new(input_params)
    if @input.save
      redirect_to inputs_path(title_id: @input.title_id)
    else
      @title = @input.title
      @user = @title.user
      render :new
    end
  end

  def index
    @title = Title.find(params[:title_id])
    @user = @title.user
    @inputs = @title.inputs.page(params[:page]).reverse_order
  end

  def show
    @input = Input.find(params[:id])
    @title = @input.title
    @user = @title.user
    @outputs = @input.outputs
    @comment = Comment.new
    @comments_view = @input.comments.page(params[:page]).per(5)
  end

  def edit
    @input = Input.find(params[:id])
    @title = @input.title
    @user = @title.user
  end

  def update
    @input = Input.find(params[:id])
    if @input.update(input_params)
      redirect_to input_path(@input.id)
    else
      @title = @input.title
      @user = @title.user
      render :edit
    end
  end

  private

  def input_params
    params.require(:input).permit(:title_id, :input, :target, :limit, :is_vaild)
  end

  def correct_user_new
      title = Title.find(params[:title_id])
      user = title.user
    if current_user != user
      redirect_to root_path
    end
  end

  def correct_user_edit
      input = Input.find(params[:id])
      title = input.title
      user = title.user
    if current_user != user
      redirect_to root_path
    end
  end

end
