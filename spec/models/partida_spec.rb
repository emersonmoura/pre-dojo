require 'spec_helper'

describe Partida do
  
  let(:gamer_name) { 'Jhon' }
  
   describe '#jogador' do
     
     before do 
       subject.addGamer Jogador.new nome: gamer_name
     end
       
     it { expect(subject.jogador(gamer_name)).not_to be_nil }
     
     it { expect(subject.jogador(gamer_name).nome).to eq gamer_name }
    
  end

end
