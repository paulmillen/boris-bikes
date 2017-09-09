require_relative 'bike'
require_relative 'bike_container'

class Garage
  attr_accessor :bikes
  include BikeContainer

  def release_bike
    remove_bike
  end

  def store(bike)
    add_bike bike
    fix_bikes
  end

private

  def fix_bikes
    self.bikes.map! {|bike| Bike.new}
  end

end
