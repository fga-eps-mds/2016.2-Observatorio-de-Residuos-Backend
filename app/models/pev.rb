# Validate description and title of pev and save name and email of user associated to the created pev
class Pev < ActiveRecord::Base
  attr_accessor :author_name, :author_email
  self.table_name = "pevs"
  has_and_belongs_to_many :users
  mount_uploader :foto, PictureUploader
  validates :descricao_pev, length: {maximum:140}
  validates :titulo_pev, presence:true
  #existe um Id_user ao invés de email.
  #validates :author_email, presence:true
end
