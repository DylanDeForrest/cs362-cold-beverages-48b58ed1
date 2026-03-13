class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir = true)
    @reservoir = reservoir
  end

  def dispense(vessel)
    reservoir.drain(vessel.volume)
  end

end
