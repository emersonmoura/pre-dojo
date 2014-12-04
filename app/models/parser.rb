class Parser < ActiveRecord::Base
  
  def parse(file)
    file.each do |line|
     return Partida.new start: /\d{8,}/.match(line)  if line.include? 'has started'      
    end
  end
end
