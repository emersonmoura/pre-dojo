require 'spec_helper'

describe Jogador do
  
  before do
    subject.kill
    subject.killed
  end
  
  it { expect(subject.assassinatos).to eq 1 }
  
  it { expect(subject.mortes).to eq 1 }

end
