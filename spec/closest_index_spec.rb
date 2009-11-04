$LOAD_PATH << File.join(File.dirname(__FILE__),".." ,"lib" )
require 'spec'
require 'closest_index'

describe ClosestIndex, ' on an empty array' do
  it 'should return nil' do
    [].closest_index(4).should be_nil
  end
end

describe ClosestIndex, ' on an array with one element' do
  it 'should return 0' do
    [1].closest_index(4).should == 0
  end
end

describe ClosestIndex, ' on an array with two elements' do
  it 'should return the closest match' do
    [7, 12].closest_index(10).should == 1
  end
end

describe ClosestIndex do
  before(:each) do
    @array = [1, 2, 3, 4, 5, 6, 7]
  end
  describe 'with an exact match' do
    it 'should return the index of that match' do
      @array.closest_index(3).should == 2
    end
  end
  describe 'with an exact match of the lowest value in the array' do
    it 'should return the index of that match' do
      @array.closest_index(1).should == 0
    end
  end
  describe 'with an exact match of the highest value in the array' do
    it 'should return the index of that match' do
      @array.closest_index(7).should == @array.length - 1
    end
  end
  describe 'with a value less than than the lowest value in the array' do
    it 'should return 0' do
      @array.closest_index(-3.5).should == 0
    end
  end
  describe 'with a value greater than than the greatest value in the array' do
    it 'should return the index of the last element' do
      @array.closest_index(35).should == @array.length - 1
    end
  end
  describe 'with a value that falls between two indices and that is closer to the higher of the two indices' do
    it 'should return the higher index' do
      @array.closest_index(3.7).should == 3
    end
  end
  describe 'with a value that falls between two indices and that is closer to the lower of the two indices' do
    it 'should return the lower index' do
      @array.closest_index(3.3).should == 2
    end
  end
  describe 'with a value that falls halfway between two indices' do
    it 'should return the higher index' do
      @array.closest_index(3.5).should == 3
    end
  end
end
