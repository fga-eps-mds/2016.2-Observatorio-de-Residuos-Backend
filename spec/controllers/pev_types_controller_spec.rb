require 'rails_helper'

RSpec.describe PevTypesController, type: :controller do
	describe "GET index" do
		it "Should render pev types" do
			get :index
			expect(response.body).to eq(PevType.where(:tipo_pev_publicado => 1).to_json)
		end
	end
end
