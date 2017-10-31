require_relative '../../spec_helper'

describe Parking::ParkingSlot do
  describe '#new' do
    it 'should raise exception when slot number not passed' do
      expect { Parking::ParkingSlot.new }.to raise_error
    end

    it 'should make slot unavailable when vehicle passed' do
      car = Vehicle::Car.new
      slot = Parking::ParkingSlot.new(slot_no: 1, vehicle: car)

      expect(slot.available?).to eq false
    end

    it 'should remain available if vehicle not passed' do
      slot = Parking::ParkingSlot.new(slot_no: 1)

      expect(slot.available?).to eq true
    end
  end

  describe '#assign' do
    it 'should set the vehicle details and make it unavailable' do
      slot = Parking::ParkingSlot.new(slot_no: 1)
      car = Vehicle::Car.new

      expect(slot.available?).to eq true

      slot.assign(car)

      expect(slot.available?).to eq false
    end
  end

  describe '#clear' do
    it 'should make the slot available' do
      slot = Parking::ParkingSlot.new(slot_no: 1, vehicle: Vehicle::Car.new)

      expect(slot.available?).to eq false

      slot.clear

      expect(slot.available?).to eq true
    end
  end
end
