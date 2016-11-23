# # Marked Marking for a user
class UsersMarkings < ActiveRecord::Migration
  
  def change
  	create_table :incidentes_usuarios, id: false do |t|
	    t.belongs_to :user, index: true
	    t.belongs_to :marking, index: true
	  end
	end

end
