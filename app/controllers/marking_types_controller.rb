class MarkingTypesController < ApplicationController
  def index
    marking_types = MarkingType.where(:tipo_incidente_publicado => 1)
    render json: marking_types
  end
end
