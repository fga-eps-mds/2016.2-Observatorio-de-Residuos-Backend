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

  def create
    nome_completo = (params[:first_name])#.to_s +" " + (params[:last_name]).to_s
    usuario = params[:email]
    senha = params[:password_digest]
    codigo_verificacao = "Lorem ipsum dolor"

    user = User.new(nome_completo: nome_completo, email: usuario,usuario: usuario, senha: senha, codigo_verificacao: codigo_verificacao)
    if user.save
        render json: user
    else
        render json: { error: 'Incorrect credentials' }, status: 401
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_nam, :email, :city, :gender, :profile_type, :password_digest)
  end
end
