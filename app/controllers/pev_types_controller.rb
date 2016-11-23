# Create type of pevs
class PevTypesController < ApplicationController
  
  def index
    pev_types = PevType.where(:tipo_pev_publicado => 1)
    render json: pev_types
  end
  
end