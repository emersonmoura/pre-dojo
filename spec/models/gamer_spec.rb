require 'spec_helper'

describe Gamer do
  
  let(:round) { Round.new id: 1 }
  
  before do
    subject.kill round
    subject.killed round
  end
  
  it { expect(subject.killings round).to eq 1 }
  
  it { expect(subject.deaths round).to eq 1 }
  
  it 'increment killings' do
    subject.kill round
    expect(subject.killings round).to eq 2
  end

end
