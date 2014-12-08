require 'spec_helper'

describe Parser do
  let(:initial_time) { 11348965 }
  let(:final_time) { 11358965 }
  let(:gamer_name) { 'Roman' }
  let(:killed_name) { 'Nick' }
  let(:ignored_killer) { '<WORLD>' }
  let(:started) { "23/04/2013 15:34:22 - New match #{initial_time} has started" }
  let(:finished) { "23/04/2013 15:39:22 - Match #{final_time} has ended" }
  let(:killer) { "23/04/2013 15:36:04 - #{gamer_name} killed #{killed_name} using M16" }
  let(:ignored) { "23/04/2013 15:36:33 - #{ignored_killer} killed #{killed_name} by DROWN" }
  let(:log) { File.open() } 
  
  describe '#parse' do
     
      it 'parse started time' do
        round = subject.parse [started]
        expect(round.start.to_i).to eq initial_time
      end
    
     it 'parse finished time' do
        round = subject.parse [started, finished]
        expect(round.finish.to_i).to eq final_time
      end
    
    context 'ignored killer' do
       before do
        @round = subject.parse [started, ignored, finished]
      end
      
     it { expect(@round.gamer(ignored_killer)).not_to be_nil }
      
      it { expect(@round.gamer(ignored_killer).name).to eq ignored_killer }
      
      it { expect(@round.gamer(ignored_killer).killings @round).to be_nil }
    
      it { expect(@round.gamer(killed_name).name).to eq killed_name }
      
      it { binding.pry; expect(@round.gamer(killed_name).deaths @round).to eq 1 }
    
    end
    
    context 'not ignored killer' do
      
      before do
        @round = subject.parse [started, killer]
      end
      
      it { expect(@round.gamer(gamer_name)).not_to be_nil }
      
      it { expect(@round.gamer(gamer_name).name).to eq gamer_name }
      
      it { expect(@round.gamer(gamer_name).killings @round).to eq 1 }
     
      it { expect(@round.gamer(killed_name).name).to eq killed_name }
      
      it { expect(@round.gamer(killed_name).deaths @round).to eq 1 }
      
    end
    
    context 'repeated killer' do
      
       before do
        @round = subject.parse [started, killer, killer]
      end
    
      it {  expect(@round.gamer(gamer_name).killings @round).to eq 2 }
      
      it { expect(@round.gamer(killed_name).deaths @round).to eq 2 }
    
    end
    
    
  end
end
