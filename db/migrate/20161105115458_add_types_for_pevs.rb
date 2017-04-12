class AddTypesForPevs < ActiveRecord::Migration
  def change
    change_table :pevs do |t|
      t.boolean :paper
      t.boolean :metal
      t.boolean :plastic
      t.boolean :glass
    end
  end
end
