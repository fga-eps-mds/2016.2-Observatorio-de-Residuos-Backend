# Author of marking have name and email saved associated to the created marking
class Marking < ActiveRecord::Base
  attr_accessor :author_name, :author_email
  self.table_name = "incidentes"
  validates :descricao_incidente, length: {maximum:140}
  validates :titulo_incidente, presence:true
end
