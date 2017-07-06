require 'van'
describe Van do

  it { is_expected.to respond_to :unload}

  describe '#unload' do
    let(:bike) { double :bike }

    it "doesn't give out a bike if there's none" do
      expect { subject.unload }.to raise_error "bike not present"
    end

  end

  it { is_expected.to respond_to(:load).with(1).argument }

  describe 'initialization' do
    subject { Van.new}
    let(:bike) { double(:bike) }

    it 'has a variable capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.load(bike)
      end
      expect{ subject.load(bike) }.to raise_error 'Van full'
    end
  end
  describe '#load' do
    it 'loads a bike' do
      bike = double(:bike)
      van_bikes = subject.load(bike)
      expect(subject.load(bike)).to eq van_bikes
    end
    it 'has a default capacity' do
      expect(subject.capacity).to eq subject.capacity
    end
  end
end
