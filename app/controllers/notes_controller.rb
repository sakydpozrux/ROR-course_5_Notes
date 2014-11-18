class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_note, only: [:show, :update, :edit, :destroy]

  # GET /notes/new
  def new
    @note = Note.new(user_id: current_user.id)
  end

  # GET /notes/1/edit
  def edit
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  # POST /notes
  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end
  
  # GET /notes/1
  def show
  end

  # GET /notes
  def index
    @notes = current_user.notes.paginate(page: params[:page])
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def find_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
