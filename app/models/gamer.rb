class Gamer < ActiveRecord::Base
  
  has_many :ranking
  has_many :round, through: :ranking
  
  def kill
    self.killings ||= 0
    self.killings+=1
  end
  
  def killed
    self.deaths ||= 0
    self.deaths+=1
  end
end
