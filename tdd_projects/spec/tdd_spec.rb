require 'rspec'
require 'tdd'

describe '#my_uniq' do
  subject(:arr) { [ 1, 2, 1, 3, 3] }
  it 'returns arrays with unique elements in original order' do
    expect(my_uniq(arr)).to eq([1, 2, 3])
  end
end

describe '#two_sum' do
  subject(:arr) { [-1, 0, 2, -2, 1] }
  it 'returns pairs of elements that sum to zero' do
    expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
  end
end

describe '#my_transpose' do
  subject(:matrix) { [ [0,1,2], [3,4,5], [6,7,8] ] }
  it 'converts between the row-oriented and column-oriented representation' do
    expect(my_transpose(matrix)).to eq( [[0, 3, 6], [1, 4, 7], [2, 5, 8]] )
  end
end

describe '#stockpicker' do
  subject(:arr) { [10, 8, 6, 2, 12, 5] }
  it 'outputs the pair of days with the highest positive price difference' do
    expect(stockpicker(arr)).to eq([3, 4])
  end
end