require 'rails_helper'

RSpec.describe PevsController, type: :controller do
	
	before :all do
		Pev.destroy_all
		PevType.destroy_all
		UserAccess.destroy_all
		User.destroy_all
		User.create! :codigo_verificacao=>"Lorem Ipsum", :usuario=>"aspdasd@hotmail.com",
		    :nome_completo=>"test teste teste", :email=>"test@email.com", 
		    :senha=>"123456"
		PevType.create! :tipo_pev=>"test", :tipo_pev_publicado=>true, :tipo_pev_usuario=>"test"
		Pev.create! :titulo_pev=>"algumacoisa", :descricao_pev=>"qualquercoisa", :id_tipo_pev=>PevType.last.id, :latitude=>10.0, :longitude=>1.0, :estado=>"GO", :cidade=>"luziania", :id_usuario=>User.last.id, :total_confirmacoes_funcionando=>0, :total_confirmacoes_fechou=>0, :paper=>true, :metal=>false, :plastic=>false, :glass=>false
	end

	describe "GET index" do
		it "Should render index" do
			get :index
			#puts(response.body)
			pev = Pev.last.attributes
			myBodyResponse = pev.merge("author_name":"test teste teste","author_email":"test@email.com")
			myBodyResponse = [myBodyResponse]
			expect(response.body).to eq(myBodyResponse.to_json)
		end
	end

	describe "GET getOnePev" do
		it "Should render first pev" do
			get :getOnePev
			expect(response.body).to eq(Pev.first.to_json)
		end
	end

	describe "GET edit" do
		it "Should render edited pev" do
			last_pev = Pev.last
			get :edit, :pev=>{:id_pev=>last_pev.id}, :descricao_pev=>"outra descrição", :titulo_pev=>"outro nome", :paper=>true, :metal=>false, :plastic=>false, :glass=>false

			expect(JSON.parse(response.body)["titulo_pev"]).to eq("outro nome")
			expect(JSON.parse(response.body)["descricao_pev"]).to eq("outra descrição")
		end
	end

	describe "POST create" do
		it "Should successfully create a pev" do
			post :create,{
				:titulo_pev=>"nova pev",
				:descricao_pev=>"description", 
				:latitude=>50.0,
				:longitude=>70.5, 
				:paper=>true, 
				:metal=>false, 
				:plastic=>false,
				:glass=>false, 
				:author_email=>"test@email.com",
				:total_confirmacoes_funcionando=>0, 
				:total_confirmacoes_fechou=>0
			}
			expect(JSON.parse(response.body)["titulo_pev"]).to eq("nova pev")
		end

		it "Should not successfull create a pev with a wrong email" do
			post :create,{
				:name=>"nova pev", 
				:description=>"description", 
				:longitude=>70.5, 
				:paper=>true, 
				:metal=>true, 
				:plastic=>false,
				:glass=>false, 
				:author_email=>"test@email"
			}
			expect(response.status).to be(401)
			expect(response.body).to eq({:error => "Invalid parameters"}.to_json)
		end

		it "Should not successfull create a pev with a wrong params" do
			post :create,{
				:name=>"nova pev", 
				:description=>"description", 
				:longitude=>70.5, 
				:paper=>true, 
				:metal=>true, 
				:plastic=>false,
				:glass=>false, 
				:author_email=>"test@email.com"
			}
			expect(response.status).to be(401)
			expect(response.body).to eq({:error => "Invalid parameters"}.to_json)
		end
	end

	describe "GET increment" do
		it "Should render pev when incremented" do
			last_pev = Pev.last
			last_user = User.last
			get :increment, :id_usuario=>User.last.id, :id_pev=>Pev.last.id, :total_confirmacoes_funcionando=>1, :total_confirmacoes_fechou=>0

			expect(JSON.parse(response.body)["total_confirmacoes_funcionando"]).to eq(1)
		end
	end

end
