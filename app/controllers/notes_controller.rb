class NotesController < ApplicationController
  before_action :authenticate_user!

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # PATCH/PUT /notes/1
  def update
    @note = Note.find(params[:id])

    if @note.update(params[:note].permit(:title, :content))
      redirect_to @note
    else
      render 'edit'
    end
  end

  # POST /notes
  def create
    @note = Note.new(params[:new].permit(:title, :content))

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
    #TODO:  add owner user_id 
  end
  
  # GET /notes/1
  def show
    @note = Note.find(params[:id])
  end

  # GET /notes
  def index
    @notes = Note.all
  end

  # DELETE /notes/1
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    
    redirect_to notes_path
  end
end
