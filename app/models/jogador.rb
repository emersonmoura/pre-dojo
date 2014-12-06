class Jogador < ActiveRecord::Base

  def maisUmaMorte
    @assassinatos ||= 0
    @assassinatos+=1
  end
end
