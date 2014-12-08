class Parser
  
  def parse(file)
    create_round(file) 
    file.each do |line|
      if line.include? 'killed'
        gamer = get_gamer(killer_name(line))
        gamer.kill unless '<WORLD>'.eql? killer_name(line)
        get_gamer(death_name(line)).killed
      end
    end
    @round.save!
    @round
  end
  
  private
  
  def get_gamer(name)
    gamer = @round.gamer name
    gamer = create_gamer name unless gamer
    gamer
  end
  
  def create_gamer(name)
    gamer = Gamer.new name: name 
    @round.add_gamer gamer
    gamer.save!
    gamer
  end
  
  def create_round(file)
    @round = Round.new
    @round.started(file.first[/\d{8,}/].to_i) if file.first.include? 'has started'
    @round.finished(file.last[/\d{8,}/].to_i) if file.last.include? 'has ended'
  end
  
  def killer_name(line)
    line.split[3] 
  end
  
  def death_name(line)
    line.split[5]
  end
  
  def gun_name(line)
    line.split[7]
  end
end
