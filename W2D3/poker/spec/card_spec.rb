require 'rspec'
require 'card'

describe Card do

  describe 'Card::make_set' do
    subject(:set) { Card.set  }

    it 'make a set of all unique combinations of SUIT and VALUE'
      expect(set).to include?(Card.new("hearts", 2))
      expect(set).to include?(Card.new("hearts", 2))
    end

  end
  
  describe '#initialize' do

    subject(:ace_spades) {Card.new("spades", 'A')}
    
    it 'accepts a suit and value as arguments'do
      expect {Card.new("spades", "A") }.to_not raise_error(ArgumentError)
    end

    it 'sets a suit' do
      expect(ace_spades.suit).to eq("spades")
    end
    
    it 'sets a value' do 
      expect(ace_spades.value).to eq("A")
    end

  end

end