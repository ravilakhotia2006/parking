require_relative '../../spec_helper'

describe Parking::ParkingLot do
  before(:all) do
    @total_slots = 10
    @lot = Parking::ParkingLot.new(slots: @total_slots)
  end

  describe '#parking_levels' do
    it 'returns parking levels created' do
      expect(@lot.parking_levels.count).to eq (1)
    end
  end

  describe '#park!' do
    it 'should park the vehicle' do
      @lot.park!('KA-01-HH-1234', 'White')

      available_slots = @lot.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      expect(available_slots).to eq (@total_slots - 1)
    end
  end

  describe '#leave!' do
    it 'should free up the parked vehicle' do
      @lot.leave!(1)

      available_slots = @lot.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      expect(available_slots).to eq (@total_slots)
    end
  end
end