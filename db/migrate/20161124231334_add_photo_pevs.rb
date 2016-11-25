class AddPhotoPevs < ActiveRecord::Migration
  def change
    add_column :pevs, :photo_link, :string;
  end
end
