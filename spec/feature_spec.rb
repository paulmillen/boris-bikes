require './lib/docking_station'

station = DockingStation.new
#bike = station.release

bike = Bike.new
station.dock(bike)
p station

bike = station.release_bike
p bike
