require './lib/enumerable.rb'

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 8, 7, 4, 5, 6] }
  let(:result) { [] }
  let(:result2) { [] }

  describe '#my_any?' do
    it 'Returns boolean if condition is passed' do
      expect(arr.my_any? { |i| i >= 5 }).to eq(true)
      expect(arr.my_any? { |i| i > 8 }).to eq(false)
      expect(arr.my_any? { |i| i }).to eq(true)
      expect(arr.my_any? { |i| i == 0 }).to eq(false)
      expect(arr.my_any? { |i| i < 2 }).to eq(true)
    end
  end

  describe '#my_none?' do
    it 'Returns boolean if condition is passed' do
      expect(arr.my_none? { |i| i >= 5 }).to eq(false)
      expect(arr.my_none? { |i| i > 8 }).to eq(true)
      expect(arr.my_none? { |i| i }).to eq(true)
      expect(arr.my_none? { |i| i == 0 }).to eq(true)
      expect(arr.my_none? { |i| i < 2 }).to eq(false)
    end
  end

  describe '#my_count' do
    it ' If an argument is given, counts the number of elements which equals'\
       ' to argument. If a block is given, counts the number of elements'\
       ' yielding a true value. ' do
      expect(arr.my_count(1)).to eq(1)
      expect(arr.my_count).to eq(arr.length)
      expect(arr.my_count(4)).to eq(1)
      expect(arr.my_count(&:even?)).to eq(4)
    end
  end

  describe '#my_each' do
    it 'Goes through each element and performs element block on the element' do
      arr.my_each { |x| result << x + 2 }
      expect(result).to eql([3, 4, 5, 10, 9, 6, 7, 8])
      arr.my_each { |x| result2 << x * 2 }
      expect(result2).to eql([2, 4, 6, 16, 14, 8, 10, 12])
    end
  end

  describe '#my_each_with_index' do
    it 'goes through each element and index and performs the block on it' do
      arr.my_each_with_index do |x, index|
        result << x
        result << index
      end
      expect(result).to eql([1, 0, 2, 1, 3, 2, 8, 3, 7, 4, 4, 5, 5, 6, 6, 7])
    end
  end

  describe '#my_select' do
    it 'Returns array with selected elements & return empty if
    selector is none' do
      expect(arr.my_select { |i| i > 3 }).to eql([8, 7, 4, 5, 6])
      expect(arr.my_select { |i| i > 0 }).to eql([1, 2, 3, 8, 7, 4, 5, 6])
      expect(arr.my_select { |i| i > 12 }).to eql([])
      expect(arr.my_select { |i| i == 7 }).to eql([7])
    end
  end

  describe '#my_all?' do
    it 'when passed block with condition not met return false & vice versa' do
      expect(arr.my_all? { |num| num < 5 }).to eql(false)
      expect(arr.my_all? { |num| num > 0 }).to eql(true)
    end
  end
end
