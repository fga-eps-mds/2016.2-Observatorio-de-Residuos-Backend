# Marked Pev for a user
class UsersPevs < ActiveRecord::Migration
  
  def change
    create_table :pevs_usuarios, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :pev, index: true
    end
  end

end
