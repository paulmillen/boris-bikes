require 'docking_station'
require 'support/shared_examples_for_bike_container'

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

    it "doesn't raise the error when we have a bike" do
      bike = double(:broken? => false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "doesn't release bike if broken" do
      bike = double(:broken? => true)
      subject.dock bike
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

    it "releases working bikes when one of the docked bikes is broken" do
      bike1 = double(:broken? => true)
      bike2 = double(:broken? => false)
      subject.dock bike1
      subject.dock bike2
      expect(subject.release_bike).to eq bike2
    end
  end

  it_behaves_like BikeContainer
end
