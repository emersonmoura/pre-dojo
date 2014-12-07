class Round < ActiveRecord::Base

  has_many :gamers
  
  def started(timestamp)
    self.start = int_to_time timestamp
  end 

  def finished(timestamp)
    self.finish =  int_to_time timestamp
  end
  
  def gamer(nome)
    self.gamers.select { |gamer| gamer.name.eql? nome }.first
  end
  
  def add_gamer(gamer)
    self.gamers ||= []
    self.gamers.push gamer unless self.gamers.include? gamer
  end
  
  private
    
  def int_to_time(time)
    Time.at(time).to_datetime
  end
end
