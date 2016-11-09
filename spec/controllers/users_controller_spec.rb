require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before :all do
		UserAccess.destroy_all
		User.destroy_all
		User.create! :codigo_verificacao=>"Lorem Ipsum", :usuario=>"aspdasd@hotmail.com",:nome_completo=>"test teste teste", :email=>"test@email.com", :senha=>"123456"
	end

	describe "GET verify_email" do
		it "Should render json with true param" do
			get :verify_email, :email => "test@email.com"

		    expect(response.body).to eq({:userExist => true}.to_json)
		end

		it "Should render json with false param" do
			get :verify_email, :email => "teste@email.com"

		    expect(response.body).to eq({:userExist => false}.to_json)
		end
	end

	describe "POST create" do
	    it "should successfully create a user" do
	    	post :create,{
					:first_name=>"test",
					:last_name=>"passed",
					:email=>"teste@email.com",
					:password_digest=>"123456",
					:birth_date => nil,
					:city=>"df",
					:gender=>"mas",
					:profile_type=>"Estudante"
				}
			puts response.body
			puts User.last.to_json
		    expect(JSON.parse(response.body)["id_usuario"]).to eq(User.last.id_usuario)
	    end

	    it "should not successfull create a user" do
	      post :create,{
	        :first_name=>"test",
					:last_name=>"passed",
					:email=>"testemailm",
					:password_digest=>"123456",
					:birth_date => nil,
					:city=>"df",
					:gender=>"mas",
					:profile_type=>"Estudante"
	      }
	      expect(response.status).to be(401)
	      expect(response.body).to eq({:error => "Incorrect credentials"}.to_json)
	    end
  	end
end
