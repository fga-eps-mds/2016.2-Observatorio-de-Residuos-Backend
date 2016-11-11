class UsersController < ApplicationController
#   before_action :set_user, only: [:show, :edit, :update, :destroy]

  def verify_email
      user = User.find_by_email(params[:email])
      if(user == nil)
          render json: {"userExist": false}
      else
          render json: {"userExist": true}
      end
  end

  def edit
    user = Pev.find_by_email(params[:email]);
    user.update(nome_completo: params[:name]);
    render json: user;
  end
  #arrumar o validates do email, enviar dois erros para o ionic
  #quando o validates da erro: "email ja cadastrado".
  def create
    primeiro_nome = params[:first_name]
    ultimo_nome = params[:last_name]
    nome_completo = primeiro_nome +" "+ultimo_nome;
    usuario = params[:email]
    senha = params[:password_digest]
    perfil = params[:profile]
    codigo_verificacao = SecureRandom.urlsafe_base64(nil, false);

    user = User.new(nome_completo: nome_completo, perfil: perfil, email: usuario,usuario: usuario, senha: senha, codigo_verificacao: codigo_verificacao)
    if user.save
        render json: user
    else
        render json: { error: 'Incorrect credentials' }, status: 401
    end
  end
end
