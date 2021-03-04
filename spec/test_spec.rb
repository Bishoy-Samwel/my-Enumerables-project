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