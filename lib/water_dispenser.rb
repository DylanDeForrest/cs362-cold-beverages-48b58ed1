class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir = true)
    @reservoir = reservoir
  end

  def dispense(vessel)
    return if reservoir.empty?
    reservoir.drain(vessel.volume)
    vessel.fill
  end

end
