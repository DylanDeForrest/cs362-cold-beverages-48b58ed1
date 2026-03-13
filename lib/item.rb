class Item
  attr_reader :name, :volume

  def initialize(name = 'FAKE', volume = 0)
    @name = name
    @volume = volume
  end

end
