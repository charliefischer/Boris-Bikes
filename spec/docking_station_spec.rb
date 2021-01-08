require 'docking_station'

describe DockingStation do
  it "checking release_bike method" do
    expect(subject).to respond_to :release_bike
  end

  # it 'releases working bikes' do
  #   bike = subject.release_bike
  #   expect(bike).to be_working
  # end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it "releases a bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'responds to bike' do
    expect(subject).to respond_to :bikes
  end

  describe '#release_bike' do
    it "raises an error when no bike in dock" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  it "raises an error when limit is reached" do
    bike = Bike.new
    station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {station.dock Bike.new }
    expect {station.dock(bike)}.to raise_error "Limit reached"
  end

  it "set a @capacity instance variable" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "test that the default capacity is 20" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      station = DockingStation.new(50)
      bike = Bike.new
      50.times {station.dock(bike)}
      expect {station.dock(bike)}.to raise_error "Limit reached"
    end
  end




end
