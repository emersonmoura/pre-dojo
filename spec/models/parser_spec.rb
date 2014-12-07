require 'spec_helper'

describe Parser do
  let(:initial_time) { 11348965 }
  let(:final_time) { 11358965 }
  let(:gamer_name) { 'Roman' }
  let(:killed_name) { 'Nick' }
  let(:started) { "23/04/2013 15:34:22 - New match #{initial_time} has started" }
  let(:finished) { "23/04/2013 15:39:22 - Match #{final_time} has ended" }
  let(:killer) { "23/04/2013 15:36:04 - #{gamer_name} killed #{killed_name} using M16" }
  
  describe '#parse' do
     
      it 'parse started time' do
        partida = subject.parse [started]
        expect(partida.start).to eq initial_time
      end
    
     it 'parse finished time' do
        partida = subject.parse [finished]
        expect(partida.finish).to eq final_time
      end 
    
    context 'play game' do
      
      before do
        @partida = subject.parse [killer]
      end
    
      it { expect(@partida.gamer(gamer_name)).not_to be_nil }
      
      it { expect(@partida.gamer(gamer_name).nome).to eq gamer_name }
      
      it { expect(@partida.gamer(gamer_name).assassinatos).to eq 1 }
      
      it 'repeated should increment existing' do
        @partida = subject.parse [killer, killer]
        expect(@partida.gamer(gamer_name).assassinatos).to eq 2
      end
     
      it { expect(@partida.gamer(killed_name).nome).to eq killed_name }
      
      it { expect(@partida.gamer(killed_name).mortes).to eq 1 }
      
    end
  end
end
