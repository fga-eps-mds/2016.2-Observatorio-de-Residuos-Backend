# Validate name and email of sign up
class User < ActiveRecord::Base
  belongs_to :user_access, :dependent => :destroy
  self.table_name = "usuarios"
  has_and_belongs_to_many :markings

   VALID_NAME_FORMAT= /[a-z|A-Z áéíóúÁÉÍÓÚçÇâôãõÂÔÃÕ]/
   validates :nome_completo, presence: true, length: {maximum: 80}, format: { with: VALID_NAME_FORMAT}

   VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
   validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: true
   before_save { self.email = email.downcase }

   #validates :profile_type, presence: true
end
