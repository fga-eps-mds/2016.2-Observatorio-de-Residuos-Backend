class ComplaintsController < ApplicationController
  def index
    render json: Complaint.all
  end

  def create
    title = params[:title]
    description = params[:description]
    author = params[:author]
    id_marking = params[:id_marking]
    complaint = Complaint.new(title: title, description: description, author: author, id_marking: id_marking)
    if complaint.save
        render json: complaint
    else
        render json: { error: 'Incorrect credentials' }, status: 401
        puts complaint.errors.messages
    end
  end
end
