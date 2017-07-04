require './lib/docking_station'

station = DockingStation.new

bike1 = Bike.new
station.dock(bike1)
p station
bike2 = Bike.new
station.dock(bike2)
p station
