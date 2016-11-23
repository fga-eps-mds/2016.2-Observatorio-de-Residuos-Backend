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
            expect(JSON.parse(response.body)["id_tipo_incidente"]).to eq(1)
            expect(JSON.parse(response.body)["tipo_incidente"]).to eq("Lixo acumulado em margens de rios e lagoas")
            expect(JSON.parse(response.body)["tipo_incidente_ordem"]).to eq(1)
            expect(JSON.parse(response.body)["tipo_incidente_publicado"]).to eq(true)
            expect(JSON.parse(response.body)["tipo_incidente_usuario"]).to eq("Rodrigo")
        end
    end

end
