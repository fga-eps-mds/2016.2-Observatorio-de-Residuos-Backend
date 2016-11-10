class PevsController < ApplicationController
  def index
    pevs = Pev.all
    pevs.each do |m|
      m.author_name = User.find(m.id_usuario).nome_completo
      m.author_email = User.find(m.id_usuario).email
    end
    render json: pevs, methods:[:author_name, :author_email]
  end

  def getOnePev
    pev = Pev.first
    render json: pev;
  end

  def edit
    pev = Pev.find_by_latitude_and_longitude(params[:pev][:latitude], params[:pev][:longitude])
    pev.update(titulo_pev: params[:name], descricao_pev: params[:description]);
    render json: pev;
  end

###################################################################
  def increment
    #pev = Pev.find_by_id_pev(params[:])
    pev = Pev.find_by_latitude_and_longitude(params[:pev][:latitude], params[:pev][:longitude])
    pev.total_confirmacoes_funcionando = params[:likes]
    pev.total_confirmacoes_fechou = params[:dislikes]
    pev.save
    render json: pev;
  end
####################################################################

  def create
    titulo_pev = params[:name]
    descricao_pev = params[:description]
    id_tipo_pev = 1
    latitude = params[:latitude]
    longitude = params[:longitude]
    estado = 'XX'
    cidade = 'to do pegarCidade'
    paper = params[:paper]
    metal = params[:metal]
    plastic = params[:plastic]
    glass = params[:glass]
###################################################################
    total_confirmacoes_funcionando = params[:likes]
    total_confirmacoes_fechou = params[:dislikes]
###################################################################

    id_usuario = User.find_by_email(params[:author_email]).id_usuario;
    pev = Pev.new(titulo_pev: titulo_pev, descricao_pev: descricao_pev,
                  id_tipo_pev: id_tipo_pev, latitude: latitude,
                  longitude: longitude, estado: estado, cidade: cidade,
                  id_usuario: id_usuario,paper: paper, metal: metal,
                  plastic: plastic, glass: glass,
###################################################################
                  total_confirmacoes_funcionando: total_confirmacoes_funcionando,
                  total_confirmacoes_fechou: total_confirmacoes_fechou)
###################################################################
    if pev.save
        render json: pev
    else
        render json: { error: 'Invalid parameters' }, status: 401
        puts pev.errors.messages
    end
  end

  private
  def pev_params
###################################################################
    params.require(:pev).permit(:author_email, :name, :plastic, :paper, :metal, :glass, :latitude, :longitude, :description, :likes, :dislikes) 
###################################################################
  end
end