require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

    it "doesn't raise the error when we have a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  #it { is_expected.to respond_to(subject.bikes)}
  describe 'initialization' do
    subject { DockingStation.new}
    let(:bike) { Bike.new }

    it 'has a vvariable capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
  describe '#dock' do
    it 'docks a bike' do
      #bikes = []
      bike = Bike.new
      bikes = subject.dock(bike)
      expect(subject.dock(bike)).to eq bikes
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq subject.capacity

    end
    it 'can store up to x bikes' do
      expect( subject.capacity.times { subject.dock(Bike.new)}).to eq subject.capacity
    end

    it 'returns error when more than x bikes' do
      expect { ((subject.capacity)+1).times {subject.dock(Bike.new)}}.to raise_error "Docking station full"
    end
  end
end
