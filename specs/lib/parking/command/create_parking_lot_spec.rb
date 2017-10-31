require_relative '../../../spec_helper'

describe Command::CreateParkingLot do
  describe '#execute' do
    it 'should create a parking lot instance with given slot_no' do
      lot = Command::CreateParkingLot.new.execute(nil, slots: 2)

      expect(lot).to be_a Parking::ParkingLot
      expect(lot.parking_levels.count).to eq 1
      expect(lot.parking_levels.first.parking_slots.count).to eq 2
    end

    it 'should not raise the exception if slots not passed' do
      lot = nil

      expect { lot = Command::CreateParkingLot.new.execute(nil, {}) }.to_not raise_error
      expect(lot.parking_levels.count).to eq 0
    end
  end
end