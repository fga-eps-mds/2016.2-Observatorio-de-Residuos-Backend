class AddPhotoMarking < ActiveRecord::Migration
  def change
    add_column :incidentes, :photo_link, :string;
  end
end
