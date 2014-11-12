class NotesController < ApplicationController
  before_action :authenticate_user!

  # GET /notes/new
  def new
    @note = Note.new(user_id: current_user.id)
  end

  # GET /notes/1/edit
  def edit
    @note = current_user.notes.find(params[:id])
  end

  # PATCH/PUT /notes/1
  def update
    @note = current_user.notes.find(params[:id])

    if @note.update(params[:note].permit(:title, :content))
      redirect_to @note
    else
      render 'edit'
    end
  end

  # POST /notes
  def create
    @note = current_user.notes.build(params.require(:note).permit(:title, :content))

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end
  
  # GET /notes/1
  def show
    @note = current_user.notes.find(params[:id])
  end

  # GET /notes
  def index
    @notes = current_user.notes.paginate(page: params[:page])
  end

  # DELETE /notes/1
  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy
    
    redirect_to notes_path
  end
end
