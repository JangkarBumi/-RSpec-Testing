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

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 8, 10] }
  let(:result) { [] }

  describe '#my_each' do
    it 'Goes through each element and add 2' do
      arr.my_each { |x| result << x + 2 }
      expect(result).to eql([3, 4, 5, 10, 12])
    end
  end

  describe '#my_each_with_index' do
    it 'goes through each element and index and performs the block on it' do
      arr.my_each_with_index do |x, index|
        result << x
        result << index
      end
      expect(result).to eql([1, 0, 2, 1, 3, 2, 8, 3, 10, 4])
    end
  end
end

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 8, 10] }
  let(:result) { [] }

  describe '#my_select' do
    it 'Returns array with elements bigger than 3' do
      expect(arr.my_select { |i| i > 3 }).to eql([8, 10])
    end
  end

  describe '#my_all?' do
    context 'when passed block with condition not met' do
      it 'returns false' do
        expect(arr.my_all? { |num| num < 5 }).to eql(false)
      end
    end
  end
end
