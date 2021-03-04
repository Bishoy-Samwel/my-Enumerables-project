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
    expect([1, 2, 3, 4, 5].my_select(&:even?)).to eql([2, 4])
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
  it  "any of the elements' length larger than or equal a specific value?" do
    expect(ary.my_any? { |word| word.length >= 3 }).to eql(true)
    expect(ary.my_any? { |word| word.length >= 4 }).not_to eql(false)
  end
  it "any of the elements match a pattern?" do
    expect(ary.my_any?(/d/)).to eql(false)
  end
  it "any of the elements is an Integer?" do
    expect([nil, true, 99].my_any?(Integer)).to eql(true)
  end
  it "any of the elements has a value or true?" do
    expect([nil, true, 99].my_any? ).to eql(true)
  end
  it "any of the elements is equal to a specific string" do
    expect(["bear","cow","pig"].my_any?("bear")).to eql(true)
    expect(["fish","cow","pig"].my_any?("bear")).not_to eql(true)
  end
end

describe 'my_none?' do
  ary = %w{ant bear cat}
  it "none of the elements is equal to 5?" do
    expect(ary.my_none? { |word| word.length == 5 }).to eql(true)
  end
  it "none of the elements is larger than or equal 4?" do
    expect(ary.my_none? { |word| word.length >= 4 }).to eql(false)
  end
  it "none of the elements is digit?" do
    expect(ary.my_none?(/d/)).to eql(true)
  end
  it "none of the elements is float?" do
    expect([1, 3.14, 42].my_none?(Float)).to eql(false)
  end
  it "the list is empty?" do
    expect([].my_none?).to eql(true)
  end
  it "the list has only nil or false?" do
    expect([nil].my_none?).to eql(true)
    expect([nil, false].my_none?).to eql(true)
    expect( [nil, false, true].my_none?).not_to eql(true)
  end
  it "none of the elements is equat to a specific string?" do
    expect( ["fish","cow","pig"].my_none?("bear")).to eql(true)
    expect( ["bear","cow","pig"].my_none?("bear")).not_to eql(true)
  end
end