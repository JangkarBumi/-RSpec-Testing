require './lib/enumerable.rb'

describe Enumerable do
  let(:arr) { [1, 2, 3, 8, 7, 4, 5, 6] }

  describe '#my_select' do
    it 'Returns array with elements bigger than 3' do
      expect(arr.my_select { |i| i > 3 }).to eq([8, 7, 4, 5, 6])
    end
  end

  describe '#my_any?' do
    it 'Returns boolean true if condition is passed' do
      expect(arr.my_any? { |i| i >= 5 }).to eq(true)
      expect(arr.my_any? { |i| i > 8 }).to eq(false)
      expect(arr.my_any? { |i| i }).to eq(true)
      expect(arr.my_any? { |i| i == 0 }).to eq(false)
      expect(arr.my_any? { |i| i < 2 }).to eq(true)
    end
  end

  describe '#my_none?' do
    it 'Returns boolean false if condition is passed vise-versa' do
      expect(arr.my_none? { |i| i >= 5 }).to eq(false)
      expect(arr.my_none? { |i| i > 8 }).to eq(true)
      expect(arr.my_none? { |i| i }).to eq(true)
      expect(arr.my_none? { |i| i == 0 }).to eq(true)
      expect(arr.my_none? { |i| i < 2 }).to eq(false)
    end
  end
end
