require 'bike'
require 'bike_container'

class Garage
  include BikeContainer

  def release_bike
    fail "bike not present" if empty?
    garage_bikes.shift
  end

  def dock (bike)
    fail "Docking station full" if full?
    garage_bikes << bike
  end

  def fix
    garage_bikes.map! {|bike| Bike.new}
  end

private

end
