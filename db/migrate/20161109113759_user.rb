# User
class User < ActiveRecord::Migration
  def change
  	 change_table :usuarios do |t|
  	 	t.belongs_to :user_access, :foreign_key => "id_usuario"
  	 end
  end
end
