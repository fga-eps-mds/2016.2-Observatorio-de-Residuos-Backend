class MarkingsController < ApplicationController
  def index
    markings = Marking.all
    markings.each do |m|
      m.author_name = User.find(m.id_usuario).nome_completo
      m.author_email = User.find(m.id_usuario).email
    end
    render json: markings, methods:[:author_name, :author_email]
  end

  def new
    marking = Marking.new
  end

  def create
    titulo_incidente = params[:name]
    descricao_incidente = params[:description]
    id_tipo_incidente = 12
    imagem_incidente = 'imagem'
    latitude = params[:latitude]
    longitude = params[:longitude]
    estado = 'GO'
    cidade = 'Luziania'
    id_usuario = User.find_by_email(params[:author_email]).id_usuario;
    marking = Marking.new(titulo_incidente: titulo_incidente, descricao_incidente: descricao_incidente, id_tipo_incidente: id_tipo_incidente, imagem_incidente: imagem_incidente, latitude: latitude, longitude: longitude, estado: estado, cidade: cidade, id_usuario: id_usuario)
    if marking.save
        render json: marking
    else
        render json: { error: 'Incorrect credentials' }, status: 401
        puts marking.errors.messages
    end
  end

  def edit
    marking = Marking.find_by_latitude_and_longitude(params[:marking][:latitude], params[:marking][:longitude])
    marking.titulo_incidente = params[:name]
    marking.descricao_incidente = params[:description]
    marking.save
    render json: marking;
  end
end
