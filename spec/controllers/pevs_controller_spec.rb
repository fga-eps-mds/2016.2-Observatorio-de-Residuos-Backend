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
		Pev.create! :titulo_pev=>"algumacoisa", :descricao_pev=>"qualquercoisa", 
					:id_tipo_pev=>PevType.last.id, :latitude=>10.0, :longitude=>1.0, :cep=>"73000000", 
					:estado=>"GO", :cidade=>"luziania", :bairro=>"seila", 
					:logradouro=>"seila", :numero=>"1", :complemento=>"seila", 
					:id_usuario=>User.last.id, :total_visualizacoes=>0, :total_confirmacoes_funcionando=>0, 
					:total_confirmacoes_fechou=>0, :total_denuncias=>0, :status=>"open", 
					:adicionado_em=>DateTime.now, :publicado=>true
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
			get :edit, :pev=>{:latitude=>10.0, :longitude=>1.0}, :name=>"outro nome", :description=>"outra descrição"
			expect(JSON.parse(response.body)["titulo_pev"]).to eq("outro nome")
			expect(JSON.parse(response.body)["descricao_pev"]).to eq("outra descrição")
		end
	end

	describe "POST create" do
		it "Should successfully create a pev" do
			post :create,{
					:name=>"nova pev", 
					:description=>"description", 
					:latitude=>50.0,
					:longitude=>70.5, 
					:paper=>true, 
					:metal=>false, 
					:plastic=>false,
					:glass=>false, 
					:author_email=>"test@email.com"
			}
			expect(JSON.parse(response.body)["titulo_pev"]).to eq("nova pev")
		end

		#it "Should not successfull create a pev" do
		#	post :create,{
		#			:name=>"nova pev", 
		#			:description=>"description", 
		#			:longitude=>70.5, 
		#			:paper=>true, 
		#			:metal=>true, 
		#			:plastic=>false,
		#			:glass=>false, 
		#			:author_email=>"test@email.com"
		#	}
		#	#expect(response.status).to be(401)
		#	expect(response.body).to eq({:error => "Invalid parameters"}.to_json)
		#end
	end
end
