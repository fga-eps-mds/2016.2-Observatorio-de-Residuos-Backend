class CreateUserAccesses < ActiveRecord::Migration
  def change
    create_table :user_accesses do |t|
      t.timestamps null: false
    end
  end
end
