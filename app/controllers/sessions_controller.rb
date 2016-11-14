# Every time a user sign in at application it create a session for user or if email  or password are wrong then
# user is unauthorized to enter in application
class SessionsController < ApplicationController

  def create
	  user = User.find_by_email(params[:email])
	  if user && user.senha == params[:encripted_password]
      check_status user
	  else
	  	render json:{}, :status => :unauthorized
	  end
	end

  def check_status user
    if user.ativo
        render json: user
      else
        render json:{}, :status => :forbidden
      end
  end

end
