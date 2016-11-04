class MarkingsController < ApplicationController
  before_action :set_marking, only: [:show, :edit, :update, :destroy]

  def index
    render json: Marking.all
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

  private
  def marking_params
    params.require(:marking).permit(:name, :fire, :water, :earth, :air, :description, :latitude, :longitude)
  end
end
