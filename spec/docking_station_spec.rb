require 'docking_station'
describe DockingStation do

  it { is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    let(:bike) { double :bike }
    it 'releases working bikes' do
      allow(bike).to receive_messages(
      :working? => true,
      :broken? => false)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

    it "doesn't raise the error when we have a bike" do
      bike = double(:broken? => false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "doesn't release bike if broken" do
      bike = double(:broken? => true)
      subject.dock bike
      expect {subject.release_bike}.to raise_error "Cannot release, bike broken"
    end

    it "releases working bikes when one of the docked bikes is broken" do
      bike1 = double(:broken? => true)
      bike2 = double(:broken? => false)
      subject.dock bike1
      subject.dock bike2
      expect(subject.release_bike).to eq bike2
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  #it { is_expected.to respond_to(subject.bikes)}
  describe 'initialization' do
    subject { DockingStation.new}
    let(:bike) { double(:bike) }

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
      bike = double(:bike)
      bikes = subject.dock(bike)
      expect(subject.dock(bike)).to eq bikes
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq subject.capacity

    end
    it 'can store up to x bikes' do
      expect( subject.capacity.times { subject.dock(double(:bike))}).to eq subject.capacity
    end

    it 'returns error when more than x bikes' do
      expect { ((subject.capacity)+1).times {subject.dock(double(:bike))}}.to raise_error "Docking station full"
    end
  end
end
