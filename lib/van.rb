class Van
  attr_reader :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @van_bikes = []
    @capacity = capacity
  end

  def unload
    fail "bike not present" if empty?
    van_bikes.shift
  end

  def load(bike)
    fail "Van full" if full?
    van_bikes << bike
  end

private
attr_reader :van_bikes
def full?
 van_bikes.count >= capacity
end

def empty?
  van_bikes.empty?
end

end
