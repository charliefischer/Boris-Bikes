require "docking_station.rb"
require 'bike.rb'

describe DockingStation do

  describe ".release_bike" do
    it { is_expected.to respond_to(:release_bike) }
  end
  context "bike working?" do
    it "bike working" do
      expect(DockingStation.new.release_bike.working?).to eq("working")
    end
  end
  describe ".dock_bike" do
    it { is_expected.to respond_to(:dock_bike) } 
  end
end
