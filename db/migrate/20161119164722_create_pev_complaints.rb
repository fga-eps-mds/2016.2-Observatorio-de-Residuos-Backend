# PEV complaints
class CreatePevComplaints < ActiveRecord::Migration
  
  def change
    create_table :pev_complaints do |t|
      t.string :title
      t.string :description
      t.string :author
      t.integer :id_pev

      t.timestamps null: false
    end
  end

end
