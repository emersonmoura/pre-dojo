class Ranking < ActiveRecord::Base
  belongs_to :round
  belongs_to :gamer
end
