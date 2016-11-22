# Author of marking have name and email saved associated to the created marking
class Marking < ActiveRecord::Base
  attr_accessor :author_name, :author_email, :likes, :dislikes
  self.table_name = "incidentes"
  has_and_belongs_to_many :users
  validates :descricao_incidente, length: {maximum:140}
  validates :titulo_incidente, presence:true
end
