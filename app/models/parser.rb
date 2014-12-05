class Parser < ActiveRecord::Base
  
  def parse(file)
    partida = Partida.new
    file.each do |line|
      partida.started(line[/\d{8,}/].to_i) if line.include? 'has started'
      
      partida.finished(line[/\d{8,}/].to_i) if line.include? 'has ended'
    end
    partida
  end
end
