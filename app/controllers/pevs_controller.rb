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
    titulo_pev = params[:name]
    descricao_pev = params[:description]
    id_tipo_pev = 1
    latitude = params[:latitude]
    longitude = params[:longitude]
    estado = 'CU'
    cidade = 'to do pegarCidade'
    id_usuario = 1
    paper = params[:paper]
    metal = params[:metal]
    plastic = params[:plastic]
    glass = params[:glass]
    id_usuario = User.find_by_email(params[:author_email]).id_usuario;

    pev = Pev.new(titulo_pev: titulo_pev, descricao_pev: descricao_pev,
                  id_tipo_pev: id_tipo_pev, latitude: latitude,
                  longitude: longitude, estado: estado, cidade: cidade,
                  id_usuario: id_usuario,paper: paper, metal: metal,
                  plastic: plastic, glass: glass)
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
