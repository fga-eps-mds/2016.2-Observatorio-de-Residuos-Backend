class AddPhotoUser < ActiveRecord::Migration
  def change
    add_column :usuarios, :photo_link, :string;
  end
end
