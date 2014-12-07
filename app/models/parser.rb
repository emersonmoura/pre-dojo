class Parser < ActiveRecord::Base
  
  def parse(file)
    create_round(file) 
    file.each do |line|
      if line.include? 'killed'
        gamer(gamer_name(line)).kill
        gamer(killed_name(line)).killed
      end
    end
    @round
  end
  
  private
  
  def gamer(name)
    gamer = @round.gamer name
    gamer = criar_gamer name unless gamer
    gamer
  end
  
  def criar_gamer(name)
    gamer = Jogador.new nome: name 
    @round.addGamer gamer
    gamer
  end
  
  def create_round(file)
    @round = Partida.new
    @round.started(file.first[/\d{8,}/].to_i) if file.first.include? 'has started'
    @round.finished(file.last[/\d{8,}/].to_i) if file.last.include? 'has ended'
  end
  
  def gamer_name(line)
    line.split[3]
  end
  
  def killed_name(line)
    line.split[5]
  end
end
