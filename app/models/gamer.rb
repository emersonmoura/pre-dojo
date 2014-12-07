class Gamer < ActiveRecord::Base
  def kill
    self.killings ||= 0
    self.killings+=1
  end
  
  def killed
    self.deaths ||= 0
    self.deaths+=1
  end
end
