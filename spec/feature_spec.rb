=begin
require './lib/docking_station'

station = DockingStation.new

20.times { station.dock Bike.new }
station.dock Bike.new
=end
