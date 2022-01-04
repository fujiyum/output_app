class NotesController < ApplicationController
  def new
    @title = Title.find(params[:title_id])
    @note = @title.notes.new
    @user = @title.user
  end

  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to notes_path(title_id: @note.title_id)
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
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to notes_path(title_id: note.title_id)
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
