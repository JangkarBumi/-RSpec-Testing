require './lib/enumerable.rb'

describe Enumerable do
  let(:arr) { [1, 2, 3, 8, 7, 4, 5, 6] }

  describe '#my_select' do
    it 'Returns array with elements bigger than 3' do
      expect(arr.my_select { |i| i > 3 }).to eq([8, 7, 4, 5, 6])
    end
  end
end
