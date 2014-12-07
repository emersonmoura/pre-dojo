class Jogador < ActiveRecord::Base
  def kill
    self.assassinatos ||= 0
    self.assassinatos+=1
  end
  
  def killed
    self.mortes ||= 0
    self.mortes+=1
  end
end
