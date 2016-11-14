# Controller of user profiles that render a json
class ProfilesController < ApplicationController
  def index
    render json: Profile.all
  end
end
