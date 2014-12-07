require 'spec_helper'

describe Gamer do
  
  before do
    subject.kill
    subject.killed
  end
  
  it { expect(subject.killings).to eq 1 }
  
  it { expect(subject.deaths).to eq 1 }

end
