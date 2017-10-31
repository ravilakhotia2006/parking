require_relative '../../../spec_helper'

describe Command::Park do
  before(:each) do
    @lot = Parking::ParkingLot.new(slots: 2)
  end

  describe '#execute' do
    it 'should park the vehicle' do
      available_slots = @lot.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      result = Command::Park.new.execute(@lot, reg_no: 'reg-1', color: 'White')

      expect_available_slots = result.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      slot = result.parking_levels.first.parking_slots.first

      expect(available_slots).to eq 2
      expect(expect_available_slots).to eq 1
      expect(slot.vehicle.color).to eql('White')
      expect(slot.vehicle.reg_no).to eql('reg-1')
    end

    it 'should do nothing if reg_no or color is not passed' do
      available_slots = @lot.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      result = Command::Park.new.execute(@lot, reg_no: 'reg-1')

      expect_available_slots = result.parking_levels.first.parking_slots.inject(0) do |result, slot|
        result += 1 if slot.available?
        result
      end

      expect(available_slots).to eq 2
      expect(expect_available_slots).to eq 2
    end

  end
end