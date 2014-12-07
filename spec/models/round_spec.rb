require 'spec_helper'

describe Round do
  
  let(:gamer_name) { 'Jhon' }
  
   describe '#gamer' do
     
     before do 
       subject.add_gamer Gamer.new name: gamer_name
     end
       
     it { expect(subject.gamer(gamer_name)).not_to be_nil }
     
     it { expect(subject.gamer(gamer_name).name).to eq gamer_name }
    
  end

end
