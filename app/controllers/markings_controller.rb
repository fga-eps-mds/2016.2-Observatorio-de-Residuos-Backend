# Markings controller
class MarkingsController < ApplicationController
  
  # Keep user name and email in a marking that user marked and search for users marked markings
  def index
    markings = Marking.all
    markings.each do |m|
      user = User.find_by_id_usuario(m.id_usuario);
      m.author_name =  (user!=nil) ? user.nome_completo : "anonimo"
      m.author_email = (user!=nil) ? user.email : "anonimo"
    end
    render json: markings, methods:[:author_name, :author_email]
  end

  def new
    marking = Marking.new
  end

  def increment
    user = User.find_by_id_usuario(params[:id_usuario]);
    marking = Marking.find_by_id_incidente(params[:id_incidente])
    marking.total_confirmacoes_existencia = params[:total_confirmacoes_existencia]
    marking.total_confirmacoes_resolvido = params[:total_confirmacoes_resolvido]
    user.markings << marking
    marking.save
    render json: marking;
  end

  # Create marking with success if has complete information and failed if has lack information
  def create
    titulo_incidente = params[:titulo_incidente]
    descricao_incidente = params[:descricao_incidente]
    id_tipo_incidente = params[:id_tipo_incidente]
    imagem_incidente = 'imagem'
    latitude = params[:latitude]
    longitude = params[:longitude]
    estado = 'GO'
    cidade = 'Luziania'
    total_confirmacoes_existencia = params[:total_confirmacoes_existencia]
    total_confirmacoes_resolvido = params[:total_confirmacoes_resolvido]

    id_usuario = User.find_by_email(params[:author_email]).id_usuario;

    marking = Marking.new(titulo_incidente: titulo_incidente, id_tipo_incidente: id_tipo_incidente, 
      descricao_incidente: descricao_incidente, id_tipo_incidente: id_tipo_incidente, 
      imagem_incidente: imagem_incidente, latitude: latitude, longitude: longitude, 
      estado: estado, cidade: cidade, id_usuario: id_usuario, total_confirmacoes_existencia: total_confirmacoes_existencia,
      total_confirmacoes_resolvido: total_confirmacoes_resolvido, photo_link: params[:photo_link])
    if marking.save
      render json: marking
    else
      render json: { error: 'Incorrect credentials' }, status: 401
      puts marking.errors.messages
    end
  end

  # Edit marking information changed
  def edit
    marking = Marking.find_by_id_incidente(params[:id_incidente])
    marking.titulo_incidente = params[:titulo_incidente]
    marking.descricao_incidente = params[:descricao_incidente]
    marking.id_tipo_incidente = params[:id_tipo_incidente]
    marking.photo_link = params[:photo_link]
    marking.save
    render json: marking;
  end

  def image_upload
    uploader = PictureUploader.new
    uploader.store!(params[:file])
    render json: 'upload'
  end
  
end
