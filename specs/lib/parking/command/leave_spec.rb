require_relative '../../../spec_helper'

describe Command::Leave do
  before(:each) do
    @lot = Parking::ParkingLot.new(slots: 2)
    @lot.park!('reg-1', 'White')
  end

  describe '#execute' do
    it 'should free up the slot passed to it' do
      available_slots = @lot.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      result = Command::Leave.new.execute(@lot, slot_no: 1)

      expect_available_slots = result.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      expect(available_slots).to eq 1
      expect(expect_available_slots).to eq 2
    end

    it 'should not free up the slot if slot_no is not passed' do
      available_slots = @lot.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      result = Command::Leave.new.execute(@lot)

      expect_available_slots = result.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      expect(available_slots).to eq 1
      expect(expect_available_slots).to eq 1
    end

  end
end