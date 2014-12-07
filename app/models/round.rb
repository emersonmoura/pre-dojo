class Round < ActiveRecord::Base

  has_many :gamers
  
  def started(time)
    self.start = time
  end 

  def finished(time)
    self.finish = time
  end
  
  def gamer(nome)
    self.gamers.select { |gamer| gamer.name.eql? nome }.first
  end
  
  def add_gamer(gamer)
    self.gamers ||= []
    self.gamers.push gamer unless self.gamers.include? gamer
  end
end
