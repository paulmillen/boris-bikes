require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do
  it_behaves_like BikeContainer

  it { is_expected.to respond_to :release_bike}

  describe '#fix_bikes' do

    it 'returns the same number of bikes' do
      bike = double(:broken? => true)
      subject.store(bike)
      expect(subject.bikes.count).to eq 1
    end

    it 'returns a working bike' do
      bike = double(broken?: true)
      subject.store(bike)
      expect(subject.bikes[0]).to be_working
    end
  end

end
