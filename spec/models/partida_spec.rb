require 'spec_helper'

describe Partida do
  
  let(:gamer_name) { 'Jhon' }
  
   describe '#gamer' do
     
     before do 
       subject.addGamer Jogador.new nome: gamer_name
     end
       
     it { expect(subject.gamer(gamer_name)).not_to be_nil }
     
     it { expect(subject.gamer(gamer_name).nome).to eq gamer_name }
    
  end

end
