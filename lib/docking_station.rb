require_relative 'bike'

class DockingStation
  attr_reader :bike
  DEFAULT_CAPACITY = 20
  def initialize
    @bike = []
  end

  def release_bike
    fail "bike not present" if empty?
    @bike.shift
  end

  def dock (bike)
    fail "Docking station full" if full?
    @bike << bike
  end

private

def full?
 @bike.count >= DEFAULT_CAPACITY
end

def empty?
  @bike.empty?
end

end
