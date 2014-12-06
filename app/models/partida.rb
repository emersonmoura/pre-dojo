class Partida < ActiveRecord::Base
  attr_reader :start, :finish, :jogador_nome
  has_many :jogadores, class_name:  'Jogador'
  
  def initialize
    @jogadores ||= []
  end
  
  def started(time)
    @start = time
  end 

  def finished(time)
    @finish = time
  end
  
  def jogador(nome)
    @jogadores.select { |jogador| jogador.nome.eql? nome }.first
  end
  
  def addGamer(gamer)
    @jogadores.push gamer unless @jogadores.include? gamer
  end
end
