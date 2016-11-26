class AddPictureToPevs < ActiveRecord::Migration
  def change
    add_column :pevs, :foto, :string
  end
end
