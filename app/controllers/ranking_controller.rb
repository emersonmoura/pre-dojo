class RankingController < ApplicationController
  def index
  end
  
  def log
    text = params[:log][:text]
    Parser.new.parse text.lines unless text.empty?
    render :index
  end
  
  def destroy
    Gamer.delete_all
    Round.delete_all
    render :index
  end
end
