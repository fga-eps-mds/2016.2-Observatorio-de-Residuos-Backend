# PEVs controller
class PevsController < ApplicationController
  # Keep user name and email in a pev that user marked and search for users marked pevs
  def index
    pevs = Pev.all
    pevs.each do |m|
      user = User.find_by_id_usuario(m.id_usuario);
      m.author_name =  (user!=nil) ? user.nome_completo : "anonimo"
      m.author_email = (user!=nil) ? user.email : "anonimo"
    end
    render json: pevs, methods:[:author_name, :author_email]
  end

  # get first pev of database
  def getOnePev
    pev = Pev.first
    render json: pev;
  end

  # Edit pev information changed
  def edit
    pev = Pev.find_by_id_pev(params[:pev][:id_pev])
    pev.update(titulo_pev: params[:titulo_pev], descricao_pev: params[:descricao_pev],
      paper: params[:paper], metal: params[:metal], plastic: params[:plastic], 
      glass: params[:glass]);
    render json: pev;
  end

  # Method of evaluation pev
  def increment
    pev = Pev.find_by_id_pev(params[:pev][:id_pev])
    pev.total_confirmacoes_funcionando = params[:likes]
    pev.total_confirmacoes_fechou = params[:dislikes]
    pev.save
    render json: pev;
  end

  # Create pev with success if has complete information and failed if has lack information
  def create
    titulo_pev = params[:titulo_pev]
    descricao_pev = params[:descricao_pev]
    id_tipo_pev = PevType.last.id
    latitude = params[:latitude]
    longitude = params[:longitude]
    estado = 'XX'
    cidade = 'to do pegarCidade'
    paper = params[:paper]
    metal = params[:metal]
    plastic = params[:plastic]
    glass = params[:glass]
    total_confirmacoes_funcionando = params[:likes]
    total_confirmacoes_fechou = params[:dislikes]

    id_usuario = User.find_by_email(params[:author_email]).id_usuario;
    pev = Pev.new(titulo_pev: titulo_pev, descricao_pev: descricao_pev,
                  id_tipo_pev: id_tipo_pev, latitude: latitude,
                  longitude: longitude, estado: estado, cidade: cidade,
                  id_usuario: id_usuario,paper: paper, metal: metal,
                  plastic: plastic, glass: glass,
                  total_confirmacoes_funcionando: total_confirmacoes_funcionando,
                  total_confirmacoes_fechou: total_confirmacoes_fechou)
    if pev.save
        render json: pev
    else
        render json: { error: 'Invalid parameters' }, status: 401
        puts pev.errors.messages
    end
  end
end
