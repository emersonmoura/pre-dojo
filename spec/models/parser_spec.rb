require 'spec_helper'

describe Parser do
  
  let(:start) { '23/04/2013 15:34:22 - New match 11348965 has started' }
  let(:end) { '23/04/2013 15:39:22 - Match 11348965 has ended' }
  let(:kill) { '23/04/2013 15:36:04 - Roman killed Nick using M16' }
  let(:file_like_object) { double("file like object") }
  
  describe '#parse' do
     
      it 'started ' do
        file_like_object.stub(:each ).and_return([start])
        partida = subject.parse file_like_object
        expect(partida.start).to eq '11348965'
      end
  end
end
