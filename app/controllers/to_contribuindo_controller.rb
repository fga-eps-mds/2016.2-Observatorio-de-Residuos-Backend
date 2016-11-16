# Tô Contribuindo controller
class ToContribuindoController < ApplicationController
  # Keep user name and email in a project that user post and search for users marked project
  def index
    toContribuindo = ToContribuindo.all
    toContribuindo.each do |m|
      user = User.find_by_id_usuario(m.id_usuario);
      m.author_name = (user!=nil) ? user.nome_completo : "anonimo"
      m.author_email = (user!=nil) ? user.email : "anonimo"
      m.author_profile = (user!=nil) ?user.perfil : "anonimo"
    end
    render json: toContribuindo, methods:[:author_name, :author_email, :author_profile]
  end
end