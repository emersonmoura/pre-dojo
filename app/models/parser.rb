class Parser < ActiveRecord::Base
  
  def parse(file)
    partida = criar_partida(file) 
    file.each do |line|
      if line.include? 'killed'
        jogador = partida.jogador gamer_name(line)
        unless jogador
          jogador = Jogador.new nome: gamer_name(line) unless jogador
          partida.addGamer jogador
        end
        jogador.maisUmaMorte
      end
    end
    partida
  end
  
  private
  
  def criar_partida(file)
    partida = Partida.new
    start = file.first
    partida.started(start[/\d{8,}/].to_i) if start.include? 'has started'
    finish = file.last
    partida.finished(finish[/\d{8,}/].to_i) if finish.include? 'has ended'
    partida
  end
  
  def gamer_name(line)
    line.split(' ')[3]
  end
  
end
