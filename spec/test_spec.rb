require_relative '../enumerable'
describe 'my_each' do
  it 'return to_enum' do
    expect([1..4].my_each { |obj| }).to eql([1..4])
  end
  it 'return to_enum' do
    expect((1..4).my_each { |obj| }).to eql((1..4))
  end
end

describe 'my_each_with_index' do
  it 'return item and index every iteration' do
    hash = {}
    %w[cat dog wombat].my_each_with_index do |item, index|
      hash[item] = index
    end
    expect(hash).to eql({ 'cat' => 0, 'dog' => 1, 'wombat' => 2 })
  end
end

describe 'my_select' do
  it 'select the elements that meet a condition' do
    expect((1..10).my_select { |i| i % 3 == 0 }).to eql([3, 6, 9])
  end
end
describe 'my_all?' do
  it "all of the elements' length are larger than a vlaue?" do
    expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
    expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).not_to eql(true)
  end
  it 'all of the elements match a pattern?' do
    expect(%w[ant bear cat].my_all?(/t/)).to eql(false)
  end
  it 'all of the elements are Numeric' do
    expect([1, 2i, 3.14].my_all?(Numeric)).to eql(true)
  end
  it 'the list has no nil or false values?' do
    expect([nil, true, 99].my_all?).to eql(false)
    expect([].my_all?).to eql(true)
  end
  it "all of the elements' value is a specific string?" do
    expect(%w[bear bear bear].my_all?('bear')).to eql(true)
    expect(%w[bear cow pig].my_all?('bear')).not_to eql(true)
  end
end

describe 'my_any?' do
  ary = %w[ant bear cat]
  it "any of the elements' length larger than or equal a specific value?" do
    expect(ary.my_any? { |word| word.length >= 3 }).to eql(true)
  end
  it 'any of the elements match a pattern?' do
    expect(ary.my_any?(/d/)).to eql(false)
  end
  it 'any of the elements is an Integer?' do
    expect([nil, true, 99].my_any?(Integer)).to eql(true)
  end
  it 'any of the elements has a value or true?' do
    expect([nil, true, 99].my_any?).to eql(true)
  end
  it 'any of the elements is equal to a specific string' do
    expect(%w[fish cow pig].my_any?('bear')).not_to eql(true)
  end
end

describe 'my_none?' do
  ary = %w[ant bear cat]
  it 'none of the elements is equal to 5?' do
    expect(ary.my_none? { |word| word.length == 5 }).to eql(true)
  end
  it 'none of the elements is larger than or equal 4?' do
    expect(ary.my_none? { |word| word.length >= 4 }).to eql(false)
  end
  it 'none of the elements is digit?' do
    expect(ary.my_none?(/d/)).to eql(true)
  end
  it 'none of the elements is float?' do
    expect([1, 3.14, 42].my_none?(Float)).to eql(false)
  end
  it 'the list is empty?' do
    expect([].my_none?).to eql(true)
  end
  it 'the list has only nil or false?' do
    expect([nil, false, true].my_none?).not_to eql(true)
  end
  it 'none of the elements is equat to a specific string?' do
    expect(%w[bear cow pig].my_none?('bear')).not_to eql(true)
  end
end

describe 'my_count?' do
  ary = [1, 2, 4, 2]
  it 'No Block => length' do
    expect(ary.my_count).to eql(4)
  end
  it 'Counts the number of elements that are 2' do
    expect(ary.my_count(2)).to eql(2)
  end
  it 'Counts the number of elements that are odd' do
    expect(ary.my_count(&:even?)).to eql(3)
  end
end

describe 'my_map' do
  it 'return the new modefied array multiply each item with it self' do
    expect((1..4).my_map { |i| i * i }).to eql([1, 4, 9, 16])
  end
  it 'return new array by converting each item to a cat string' do
    expect((1..4).my_map { 'cat' }).to eql(%w[cat cat cat cat])
  end
  it 'takes a proc ' do
    proc1 = proc { |x| x**2 }
    expect((1..4).my_map(proc1)).to eql([1, 4, 9, 16])
  end
end

describe 'my_inject' do
  it 'multiplies all the elements of the array together' do
    expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151_200)
  end
  it 'sum all the elements of the array together' do
    expect((1..3).my_inject { |sum, n| sum + n }).to eql(6)
  end
  it 'sum all the elements of the array together' do
    expect((1..3).my_inject { |sum, n| sum + n }).to eql(6)
  end
  it 'return the longest string' do
    longest = %w[cat sheep bear].my_inject do |memo, word|
      memo.length > word.length ? memo : word
    end
    expect(longest).to eql('sheep')
  end
end

describe 'multiply_els' do
  it 'multiplies all the elements of the array together ' do
    expect(multiply_els([2, 4, 5])).to eql(40)
  end
end
