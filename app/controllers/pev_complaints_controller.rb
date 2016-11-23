class PevComplaintsController < ApplicationController
  
  def index
    render json: PevComplaint.all
  end

  def create
    title = params[:title]
    description = params[:description]
    author = params[:author]
    id_pev = params[:id_pev]
    pevcomplaint = PevComplaint.new(title: title, description: description, author: author, id_pev: id_pev)
    if pevcomplaint.save
      render json: pevcomplaint
    else
      render json: { error: 'Incorrect credentials' }, status: 401
      puts pevcomplaint.errors.messages
    end
  end
  
end
