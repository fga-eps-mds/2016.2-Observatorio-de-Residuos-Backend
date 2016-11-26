class AddPictureToMarkings < ActiveRecord::Migration
  def change
    add_column :incidentes, :foto, :string
  end
end
