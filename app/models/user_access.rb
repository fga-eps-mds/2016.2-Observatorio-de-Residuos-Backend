class UserAccess < ActiveRecord::Base
	has_one :user, :dependent => :destroy
	self.table_name = "usuarios_acessos"
end
