require_relative '../lib/chiller'

describe 'A chiller' do

  it 'has capacity' do 
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
  end

  it 'starts at room temp' do 
    chiller = Chiller.new
    expect(chiller.temperature).to eq(70)
  end

  it 'can have items added to it' do 
    chiller = Chiller.new
    item = Item.new('pop', 5)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(95)
  end

  it 'can be turned on' do 
    chiller = Chiller.new
    expect{ chiller.turn_on }.not_to raise_error
  end

  it 'can be turned off' do 
    chiller = Chiller.new
    expect{ chiller.turn_off }.not_to raise_error
  end

  it 'lowers temp when set lower' do 
    chiller = Chiller.new
    chiller.set_level(3)
    expect(chiller.temperature).to eq(55)
  end

  it 'remaining capacity decreases as items are added' do
    chiller = Chiller.new
    chiller.add(Item.new('Ice Cream', 10))
    chiller.add(Item.new('Popsicle', 5))
    expect(chiller.remaining_capacity).to eq(85)
  end

end
