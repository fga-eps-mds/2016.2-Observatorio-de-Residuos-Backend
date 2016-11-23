# Controller of articles that render a json
class ProjectsController < ApplicationController
  
  def index
    render json: Project.all
  end
  
end
