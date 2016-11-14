# Article image
class ArtigoImagens < ActiveRecord::Base
  attr_accessor :author_name, :author_email, :author_profile
  self.table_name = "artigo_imagens"
end
