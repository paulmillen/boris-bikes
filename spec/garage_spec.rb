require 'garage'
describe Garage do

  it { is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    let(:bike) { double :bike }

    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'initialization' do
    subject { Garage.new}
    let(:bike) { double(:bike) }

    it 'has a variable capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = double(:bike)
      garage_bikes = subject.dock(bike)
      expect(subject.dock(bike)).to eq garage_bikes
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq subject.capacity
    end
  end

  describe '#fix' do
    it 'returns the same number of bikes' do
      bike = double(:broken? => true)
      subject.dock(bike)
      subject.fix
      expect(subject.garage_bikes.count).to eq 1
    end
    it 'returns a working bike' do
      bike = double(broken?: true)
      subject.dock(bike)
      subject.fix
      expect(subject.garage_bikes[0]).to be_working
    end
  end
end
