require_relative '../../../spec_helper'

describe Query::ParkingLotQuery do
  before(:all) do
    @lot = Parking::ParkingLot.new(slots: 10) { extend Query::ParkingLotQuery }

    @lot.park!('reg-1', 'White')
    @lot.park!('reg-2', 'White')
    @lot.park!('reg-3', 'Black')
    @lot.park!('reg-4', 'Red')
  end

  describe '#slots_by_color' do
    it 'should results slots with given color' do
      result = @lot.slots_by_color('White')

      expect(result.count).to eq 2
      expect([result.first.vehicle.reg_no, result.last.vehicle.reg_no]).to eql(['reg-1', 'reg-2'])
    end
  end

  describe '#slot_by_reg_no' do
    it 'should return the slot no of given reg no' do
      result = @lot.slot_by_reg_no('reg-1')

      expect(result.slot_no).to eq 1
      expect(result.available).to eql false
      expect(result.vehicle.color).to eq 'White'
    end
  end

end