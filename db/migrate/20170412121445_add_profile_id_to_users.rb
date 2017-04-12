class AddProfileIdToUsers < ActiveRecord::Migration
  def change
    add_column :usuarios, :id_perfil, :integer
  end
end
