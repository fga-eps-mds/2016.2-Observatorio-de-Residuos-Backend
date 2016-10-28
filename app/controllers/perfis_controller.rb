class PerfisController < ApplicationController
  def index
    render json: Perfis.all
  end
end
