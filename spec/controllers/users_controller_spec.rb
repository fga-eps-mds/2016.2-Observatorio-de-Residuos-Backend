require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before :all do
		UserAccess.destroy_all
		User.destroy_all
		User.create! :nome_completo=>"Lorem Ipsum", :usuario=>"test@email.com", :email=>"test@email.com", :senha=>"123456", :perfil=>"Estudante", :codigo_verificacao=>"qualquercoisa", :ativo=>true
	end

	describe "GET verify_email" do
		it "Should render json with found user" do
			get :verify_email, :email => "test@email.com"
		    expect(response.body == User.find_by_email("test@email.com").to_json).to be(true)
		end

		it "Should render json with false param" do
			get :verify_email, :email => "teste@email.com"

		    expect(response.body).to eq({:newUser => true}.to_json)
		end
	end

	describe "POST create" do
	    it "should successfully create a user" do
	    	post :create, :first_name=>"Lorem", :last_name=>"Ipsum", :nome_completo=>"test teste teste", :email=>"test2@email.com", :password_digest=>"123456", :profile=>"Estudante"
			
			expect(JSON.parse(response.body)["id_usuario"]).to eq(User.last.id_usuario)
	    end

	    it "should not successfull create a user with invalid email" do
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
	      expect(response.status).to be(400)
	      expect(response.body).to eq({:error => "Invalid Email"}.to_json)
	    end

	    it "Should not successfull create a user with an existing email" do
	    	post :create,{
	        :first_name=>"test",
					:last_name=>"passed",
					:email=>"test@email.com",
					:password_digest=>"123456",
					:birth_date => nil,
					:city=>"df",
					:gender=>"mas",
					:profile_type=>"Estudante"
	      	}
	      	expect(response.status).to be(401)
	      	expect(response.body).to eq({:error => "Email already used"}.to_json)
	    end
  	end

  	describe "GET edit" do 
  		it "should render json with edited user" do
  			get :edit, :email => "test@email.com", :name=>"outroNome", :perfil=>"Estudante"
  			expect(JSON.parse(response.body)["id_usuario"]).to eq(User.last.id_usuario)
  		end
  	end

  	describe "GET deactivate" do
  		it "Should deactivate the account" do
  			get :deactivate, :id=>User.last.id, :password=>User.last.senha
  			expect(JSON.parse(response.body)["ativo"]).to eq(false)
  		end

  		it "Should return 401 status if the password is wrong" do
  			get :deactivate, :id=>User.last.id, :password=>"ErrandoASenha"
  			expect(response.status).to be(401)
	      	expect(response.body).to eq({:error => "Incorrect credentials"}.to_json)
  		end
  	end
end
