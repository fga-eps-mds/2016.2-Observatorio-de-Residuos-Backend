# Article saved
class Artigos < ActiveRecord::Base
  attr_accessor :author_name, :author_email, :author_profile
  self.table_name = "artigos"
end
