# Create type of markings and search for markings
class MarkingTypesController < ApplicationController
  
  def index
    marking_types = MarkingType.where(:tipo_incidente_publicado => 1)
    render json: marking_types
  end

  def find
    marking_type = MarkingType.find_by_id_tipo_incidente(params[:id]);
    render json: marking_type;
  end
  
end
