class Pev < ActiveRecord::Base
  validates :description, length: {maximum:140}
  validates :name, presence:true
  validate :validate_type
  def validate_type
    if(!self.paper && !self.plastic && !self.metal && !self.glass)
      errors.add(:base,"Selecione ao menos um tipo de PEV")
    end
  end
end 
