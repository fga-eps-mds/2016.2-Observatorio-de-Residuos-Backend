class UsersMarkings < ActiveRecord::Migration
  	def change
	  create_table :incidentes_usuarios, id: false do |t|
	      t.belongs_to :user, index: true, foriegn_key: :id_incidente
	      t.belongs_to :marking, index: true, foriegn_key: :id_usuario
	   end
	end
end
