require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has reservoir' do 
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    expect(dispenser.reservoir).to eq(reservoir)
  end 

  it 'drains in to a vessel' do 
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('cup', 3)
    dispenser.dispense(vessel)
    expect(reservoir.current_water_volume).to eq(7)
  end

  it 'fills the vessel when dispensing' do
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 3)
    dispenser.dispense(vessel)
    expect(vessel).not_to be_empty
  end

  it 'does not fill the vessel if reservoir is empty' do
    reservoir = WaterReservoir.new(10, 0)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 3)
    dispenser.dispense(vessel)
    expect(vessel).to be_empty
  end

end
