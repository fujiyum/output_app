class NotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @title = Title.find(params[:title_id])
    @note = @title.notes.new
    @user = @title.user
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path(title_id: @note.title_id)
    else
      @title = @note.title
      @user = @title.user
      render :new
    end
  end

  def index
    @title = Title.find(params[:title_id])
    @notes = @title.notes
    @user = @title.user
  end

  def edit
    @note = Note.find(params[:id])
    @title = @note.title
    @user = @title.user
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to notes_path(title_id: note.title_id)
    else
      @title = @note.title
      @user = @title.user
      render :edit
    end
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to notes_path(title_id: note.title_id)
  end

  private

  def note_params
    params.require(:note).permit(:title_id, :note)
  end
end
