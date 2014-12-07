class Partida < ActiveRecord::Base
  attr_reader :start, :finish
  has_many :gamers, class_name:  'Jogador'
  
  def initialize
    @gamers ||= []
  end
  
  def started(time)
    @start = time
  end 

  def finished(time)
    @finish = time
  end
  
  def gamer(nome)
    @gamers.select { |gamer| gamer.nome.eql? nome }.first
  end
  
  def addGamer(gamer)
    @gamers.push gamer unless @gamers.include? gamer
  end
end
