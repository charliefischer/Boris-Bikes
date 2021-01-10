require 'dockingstation'

describe DockingStation do

  it 'changes the capacity of the station' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it 'has a default capacity when no argument is passed' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it {is_expected.to respond_to(:release_bike)}

  describe '#release_bike' do

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "doesn't release bikes when they are broken" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    # it 'releases working bikes' do
    #   bike = subject.release_bike
    #   expect(bike).to be_working
    # end

    it 'raises an error when there are no bikes' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'docks a bike and stores' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'docks a bike even if broken' do
    bike = Bike.new
    bike.report_broken
    expect(subject.dock(bike)).to eq [bike]
  end 

  it 'raises error when full capacity' do
    bike = Bike.new
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error "No more spaces"
  end

  it {is_expected.to respond_to :bikes}

  it 'show me what you got' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  # it { is_expected.to respond_to :full?}
  it 'should return true or false if station is full' do
    expect(subject.send(:full?)). to eq false
     DockingStation::DEFAULT_CAPACITY.times {subject.dock Bike.new}
    expect(subject.send(:full?)).to eq true
  end

  # it {is_expected. to respond_to :empty?}
  it "should return true or false if station is empty" do
    expect(subject.send(:empty?)).to eq true
    subject.dock(Bike.new)
    expect(subject.send(:empty?)).to eq false
  end

end
