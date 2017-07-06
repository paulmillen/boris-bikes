class Garage
  attr_reader :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @garage_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "bike not present" if empty?
    garage_bikes.shift
  end

  def dock (bike)
    fail "Docking station full" if full?
    garage_bikes << bike
  end

private
attr_reader :garage_bikes
def full?
 garage_bikes.count >= capacity
end

def empty?
  garage_bikes.empty?
end

end
