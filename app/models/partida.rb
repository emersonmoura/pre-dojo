class Partida < ActiveRecord::Base
  attr_reader :start, :finish, :jogador_nome
  has_many :jogador
  
  def started(time)
    @start = time
  end 

  def finished(time)
    @finish = time
  end 
end
