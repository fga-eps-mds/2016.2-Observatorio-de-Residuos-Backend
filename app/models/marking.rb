class Marking < ActiveRecord::Base
  attr_accessor :author_name, :author_email
  self.table_name = "incidentes"
end
