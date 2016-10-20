class CreatePevs < ActiveRecord::Migration
  def change
    create_table :pevs do |t|
      t.string :name
      t.boolean :paper
      t.boolean :plastic
      t.boolean :metal
      t.boolean :glass
      t.string :description
      t.string :latitude
      t.string :longitude
      t.timestamps null: false
    end
  end
end
