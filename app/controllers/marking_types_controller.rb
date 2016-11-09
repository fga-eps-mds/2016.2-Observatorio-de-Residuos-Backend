class MarkingTypesController < ApplicationController
  def index
    marking_types = Marking_type.where(:tipo_incidente_publicado => 1).all
    render :json marking_types;
  end
end
