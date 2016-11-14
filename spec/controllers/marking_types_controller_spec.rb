require 'rails_helper'

RSpec.describe MarkingTypesController, type: :controller do
	describe "GET index" do
		it "Should render marking types" do
			get :index
			expect(response.body).to eq(MarkingType.where(:tipo_incidente_publicado => 1).to_json)
		end
	end

	describe "GET find" do
		it "Should render a specific marking by id" do
			get :find, :id => 1
			markingType = { "id_tipo_incidente":1,"tipo_incidente":"Lixo acumulado em margens de rios e lagoas","tipo_incidente_ordem":1,"tipo_incidente_publicado":true,"tipo_incidente_usuario":"Rodrigo","tipo_incidente_adicionado_em":"2016-08-09T01:55:44.000Z" }
			expect(response.body).to eq(markingType.to_json)
		end
	end
end
