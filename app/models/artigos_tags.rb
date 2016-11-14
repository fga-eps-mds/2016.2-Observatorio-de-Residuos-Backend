# Article saved associated to one or more tags
class ArtigosTags < ActiveRecord::Base
  attr_accessor :author_name, :author_email, :author_profile
  self.table_name = "artigos_tags"
end
