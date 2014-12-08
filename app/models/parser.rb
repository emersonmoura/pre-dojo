class Parser
  
  def parse(file)
    file.each do |line|
      create_round line
      if line.include? 'killed' and @round
        
        gamer = get_gamer(killer_name(line))
        gamer.kill(@round) unless '<WORLD>'.eql? killer_name(line)
        get_gamer(death_name(line)).killed(@round)
      end
      end_round? line
    end
    @round.save! if @round
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
  
  def create_round(line)
    if line.include? 'has started'
      @round = Round.new
      @round.started(line[/\d{8,}/].to_i) 
    end
  end
  
  def end_round?(line)
    @round.finished(line[/\d{8,}/].to_i) if line.include? 'has ended' and @round
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
