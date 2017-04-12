# Controller of user profiles that render a json
class ProfilesController < ApplicationController
  
  def index
    render json: Profile.all
  end

  def show
    profile = Profile.find params[:id_perfil]
    render json: profile
  end
  
end
