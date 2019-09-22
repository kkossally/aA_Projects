require 'towers'
describe Towers do
  subject(:towers1) { Towers.new(5) }

  describe "#move" do
    it 'move stacks successfully' do
      allow(towers1).to receive(:get_move).and_return([0, 2])
      prev = [ [5, 4, 3, 2, 1] , [], [] ]
      towers1.move
      expect(towers1.stacks).to_not eq(prev)
    end
  end

  describe "#won?" do
    let(:towers2) { Towers.new(5) }

    it 'returns false if game is not over' do
      towers1.stacks = [ [3,2,1], [4], [5] ]
      expect(towers1.won?).to eq(false)
    end

    it 'returns true if game is over' do
      towers2.stacks = [ [], [], [5,4,3,2,1] ]
      expect(towers2.won?).to eq(true)
    end
  end
end