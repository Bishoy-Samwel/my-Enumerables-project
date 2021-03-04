require_relative '../enumerable'
describe 'my_each' do
  it 'return to_enum' do
    expect([1..4].my_each{|obj|}).to eql([1..4])
  end
  it 'return to_enum' do
    expect((1..4).my_each{|obj|}).to eql((1..4))
  end
end

describe 'my_each_with_index' do
  it 'return item and index every iteration' do
    hash = Hash.new
    %w(cat dog wombat).my_each_with_index { |item, index|
      hash[item] = index
    }
    expect(hash).to eql({"cat"=>0, "dog"=>1, "wombat"=>2})
  end
end

describe 'my_select' do
  it "select the elements that meet a condition" do
    expect((1..10).my_select { |i|  i % 3 == 0 }  ).to eql([3, 6, 9])
    expect([1,2,3,4,5].my_select { |num|  num.even?  }  ).to eql([2, 4])
  end
end
describe 'my_all?' do
  it "all of the elements' length are larger than a vlaue?" do
    expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
    expect( %w[ant bear cat].my_all? { |word| word.length >= 4 } ).not_to eql(true)
  end
  it "all of the elements match a pattern?" do
    expect(%w[ant bear cat].my_all?(/t/)).to eql(false)
  end
  it "all of the elements are Numeric" do
    expect([1, 2i, 3.14].my_all?(Numeric) ).to eql(true)
  end
  it "the list has no nil or false values?" do
    expect([nil, true, 99].my_all? ).to eql(false)
    expect([].my_all?).to eql(true)
  end
  it "all of the elements' value is a specific string?" do
    expect(["bear","bear","bear"].my_all?("bear") ).to eql(true)
    expect(["bear","cow","pig"].my_all?("bear")   ).not_to eql(true)
  end
end