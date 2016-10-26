class PevsController < ApplicationController
#   before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    render json: Pev.all
  end

  def getOnePev
    pev = Pev.first
    render json: pev;
  end

  def edit
    pev = Pev.find_by_latitude_and_longitude(params[:pev][:latitude], params[:pev][:longitude])
    pev.update(pev_params)
    render json: pev;
  end

  def create
    pev = Pev.new(pev_params)
    if pev.save
        render json: pev
    else
        render json: { error: 'Invalid parameters' }, status: 401
        puts pev.errors.messages
    end
  end

  private
  def pev_params
    params.require(:pev).permit(:author_email, :name, :plastic, :paper, :metal, :glass, :latitude, :longitude, :description)
  end
end
