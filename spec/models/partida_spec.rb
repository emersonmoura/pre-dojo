require 'spec_helper'

describe Partida do
   describe '#jogador' do
     
      it 'started ' do
        subject.addGamer Jogador.new nome: 'Jhon'
        expect(subject.jogador('Jhon')).not_to be_nil
      end
    
  end

end
