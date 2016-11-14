# Every time a user sign in at application it create a session for user or if email  or password are wrong then
# user is unauthorized to enter in application
class SessionsController < ApplicationController

  def create
	  user = User.find_by_email(params[:email])
	  if user && user.senha == params[:encripted_password]
	    render json: user
	  else
	  	render json:{}, :status => :unauthorized
	  end
	end

end
