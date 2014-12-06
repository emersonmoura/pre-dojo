class Jogador < ActiveRecord::Base
  def maisUmaMorte
    self.assassinatos ||= 0
    self.assassinatos+=1
  end
end
