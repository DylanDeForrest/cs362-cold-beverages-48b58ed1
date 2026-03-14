require_relative '../lib/refrigerator'

describe 'A refrigerator' do

  let(:chiller)          { Chiller.new }
  let(:freezer)          { Freezer.new }
  let(:water_reservoir)  { WaterReservoir.new(10, 10) }
  let(:water_dispenser)  { WaterDispenser.new(water_reservoir) }
  let(:refrigerator)     { Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir) }

  it 'has a total capacity combining chiller and freezer' do
    expect(refrigerator.total_capacity).to eq(200)
  end

  it 'starts with full remaining capacity' do
    expect(refrigerator.remaining_capacity).to eq(200)
  end

  it 'can chill an item, reducing remaining capacity' do
    item = Item.new('Pizza', 10)
    refrigerator.chill(item)
    expect(refrigerator.remaining_capacity).to eq(190)
  end

  it 'can freeze an item, reducing remaining capacity' do
    item = Item.new('Dreamsicle', 5)
    refrigerator.freeze(item)
    expect(refrigerator.remaining_capacity).to eq(195)
  end

  it 'turns on the chiller and freezer when plugged in' do
    expect { refrigerator.plug_in }.not_to raise_error
  end

  it 'turns off the chiller and freezer when unplugged' do
    refrigerator.plug_in
    expect { refrigerator.unplug }.not_to raise_error
  end

  it 'can set the chiller temperature level' do
    refrigerator.set_chiller_level(5)
    expect(chiller.temperature).to eq(45)
  end

  it 'can set the freezer temperature level' do
    refrigerator.set_freezer_level(3)
    expect(freezer.temperature).to eq(40)
  end

end
