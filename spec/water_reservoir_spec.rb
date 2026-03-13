require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has capacity' do 
    reservoir = WaterReservoir.new()
    expect(reservoir.capacity).to eq(10)
  end 

  it 'starts empty' do 
    reservoir = WaterReservoir.new()
    expect(reservoir).to be_empty
  end

  it 'can be initiated with water' do 
    reservoir = WaterReservoir.new(10, 5)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'can be filled to capacity' do 
    reservoir = WaterReservoir.new
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
  end

  it 'can be drained' do 
    reservoir = WaterReservoir.new(10,10)
    reservoir.drain(3)
    expect(reservoir.current_water_volume).to eq(7)
  end

end
