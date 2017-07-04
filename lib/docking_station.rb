require_relative 'bike'

class DockingStation
  attr_reader :bike
  def initialize
    @bike = []
  end

  def release_bike
    fail "bike not present" if @bike.empty?
    @bike.shift
  end

  def dock (bike)
    fail "Docking station full" if @bike.count == 20
    @bike << bike
  end
end
