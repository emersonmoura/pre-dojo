require 'spec_helper'

describe Jogador do
  
  before do
    subject.maisUmaMorte
  end
  
   it { expect(subject.assassinatos).to eq 1 }
end
