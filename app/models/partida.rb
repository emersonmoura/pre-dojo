class Partida < ActiveRecord::Base
  attr_reader :start, :end
  has_many :jogador
end
