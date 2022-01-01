class NotesController < ApplicationController
  def new
    @title = Title.find(params[:title_id])
    @note = @title.notes.new
  end

  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to notes_path(title_id: @note.title_id)
  end

  def index
    @title = Title.find(params[:title_id])
    @notes = @title.notes
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    note.update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:title_id, :note)
  end

end
