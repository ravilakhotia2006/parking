require_relative '../../spec_helper'

describe Parking::ParkingLevel do
  describe '#new' do
    it 'should create parking slots' do
      level = Parking::ParkingLevel.new(level_no: 1, slots_num: 10)

      expect(level.parking_slots.count).to eq 10
    end

    it 'should create slot id based on level number' do
      level = Parking::ParkingLevel.new(level_no: 2, slots_num: 10)

      expect(level.parking_slots.first.slot_no).to eq 31
      expect(level.parking_slots.last.slot_no).to eq 40
    end
  end

  describe '.max_slots' do
    it 'should return the max slots' do
      expect(Parking::ParkingLevel.max_slots).to eq 30
    end
  end
end