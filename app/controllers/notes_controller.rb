class NotesController < ApplicationController
  def index
     @notes = Note.all.order(created_at: :asc)
  end

  def new
     @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    
    if @note.save
      redirect_to note_path(@note)  
    else
      render :new
    end
  end
  
  def show
     @note = Note.find(params[:id])
  end

  def edit 
     @note = Note.find(params[:id])
  end

  def update 
     @note = Note.find(params[:id])
    
    if  @note.update (note_params)
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
     @note = Note.find(params[:id])
    
     @note.destroy 

    redirect_to notes_path
  end

  private 

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
