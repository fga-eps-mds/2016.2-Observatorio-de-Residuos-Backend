class ChangeAndLongitudeAndLatitudeFromMarkings < ActiveRecord::Migration
  def change
  	change_column :incidentes, :latitude, :string
  	change_column :incidentes, :longitude, :string
  end
end
