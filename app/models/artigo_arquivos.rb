# Archive with many articles
class ArtigoArquivos < ActiveRecord::Base
  attr_accessor :author_name, :author_email, :author_profile
  self.table_name = "artigo_arquivos"
end
