require 'spec_helper'

describe Parser do
  
  let(:start) { '23/04/2013 15:34:22 - New match 11348965 has started' }
  let(:finished) { '23/04/2013 15:39:22 - Match 11358965 has ended' }
  let(:killer) { '23/04/2013 15:36:04 - Roman killed Nick using M16' }
  
  describe '#parse' do
     
      it 'started ' do
        partida = subject.parse [start]
        expect(partida.start).to eq 11348965
      end
    
     it 'finished ' do
        partida = subject.parse [finished]
        expect(partida.finish).to eq 11358965
      end
    
    
     it 'gamer killer ' do
        partida = subject.parse [killer]
        expect(partida.jogador_nome).to eq 'Roman'
      end
  end
end
