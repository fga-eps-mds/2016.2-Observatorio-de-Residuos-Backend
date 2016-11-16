# Users controller
class UsersController < ApplicationController
#   before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Verify if an email already exist or not to allow or not other users to sign up with an email
  def verify_email
      user = User.find_by_email(params[:email])
      if(user == nil)
          render json: {"newUser": true}
      else
          render json: user
      end
  end

  # Edit user information changed for himself/herself
  def edit
    user = User.find_by_email(params[:email]);
    user.update(nome_completo: params[:name], perfil: params[:profile]);
    render json: user;
  end

  # Create user with success if has complete information and failed if has lack information
  def create
    primeiro_nome = params[:first_name]
    ultimo_nome = params[:last_name]
    nome_completo = primeiro_nome +" "+ultimo_nome;
    usuario = params[:email]
    senha = params[:password_digest]
    perfil = params[:profile]
    codigo_verificacao = SecureRandom.urlsafe_base64(nil, false);

    user = User.new(nome_completo: nome_completo, perfil: perfil, 
                    email: usuario,usuario: usuario, senha: senha, 
                    codigo_verificacao: codigo_verificacao,
                    ativo: true)
    if user.save
        render json: user
    else
        user = User.find_by_email(params[:email]);
        if(user == nil)
          render json: { error: 'Invalid Email' }, status: 400;
        else
          render json: { error: 'Email already used' }, status: 401;
        end
    end
  end

  def deactivate
    user = User.find_by_id_usuario(params[:id])
    if user.senha == params[:password]
      user.ativo = false
      user.save
      render json: user
    else
      render json: { error: 'Incorrect credentials' }, status: 401
    end
  end
end
