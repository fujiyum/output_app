class NotesController < ApplicationController
  def new
    @title = Title.find(params[:title_id])
    @note = @title.note.new
  end

  def create
    @title = Title.find(params[:title_id])
    @note = @title.note.new(note_params)
    @note.title_id = title.id
    @note.save
    redirect_to notes_path
  end

  def index
    @title = Title.find(params[:title_id])
    @notes = @title.note
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
