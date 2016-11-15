# Controller of articles that render a json
class ArticlesController < ApplicationController
  def index
    render json: Article.all
  end
end
