require_relative '../lib/freezer'

describe 'A freezer' do

  it 'has default' do 
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
  end

  it 'starts at room temp' do 
    freezer = Freezer.new
    expect(freezer.temperature).to eq(70)
  end

  it 'can have items added to it' do 
    freezer = Freezer.new
    item = Item.new('pop', 5)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(95)
  end

  it 'can be turned on' do 
    freezer = Freezer.new
    expect{ freezer.turn_on }.not_to raise_error
  end

  it 'can be turned off' do 
    freezer = Freezer.new
    expect{ freezer.turn_off }.not_to raise_error
  end

  it 'lowers temp when set lower' do 
    freezer = Freezer.new
    freezer.set_level(3)
    expect(freezer.temperature).to eq(40)
  end

end
