require 'docking_station'
describe DockingStation do
  it 'can respond to release_bike' do
    expect(subject).to respond_to :release_bike
  end
end
