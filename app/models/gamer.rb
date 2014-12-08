class Gamer < ActiveRecord::Base
  
  has_many :ranking
  has_many :round, through: :ranking
  
  def kill(round)
    round_ranking = get_ranking round
    round_ranking.killings ||= 0
    round_ranking.killings+=1
    round_ranking.save!
   
  end
  
  def killed(round)
    round_ranking = get_ranking round
    round_ranking.deaths ||= 0
    round_ranking.deaths+=1
    round_ranking.save!
  end
  
  def killings(round)
    temp = get_ranking(round).killings
    temp
  end
  
  def deaths(round)
    temp = get_ranking(round).deaths
    temp
  end
  
  private
  
  def get_ranking(round)
    round_ranking = ranking.where(round_id: round).take
    round_ranking ||= Ranking.new gamer: self, round: round
    round_ranking
  end
  
  
end
