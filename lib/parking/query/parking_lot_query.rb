module Query
  module ParkingLotQuery

    def slots_by_color(color)
      slots = []

      parking_levels.each do |level|
        level.parking_slots.each do |slot|
          slots << slot if slot.vehicle.color.eql?(color)
        end
      end

      slots
    end

    def slot_by_reg_no(reg_no)
      parking_levels.each do |level|
        level.parking_slots.each do |slot|
          return slot if slot.vehicle.reg_no.eql?(reg_no)
        end
      end
      nil
    end
  end
end
