module Query
  module ParkingLotQuery

    def slots_by_color(color)
      slots = []

      parking_levels.each do |level|
        level.parking_slots.each do |slot|
          if !slot.vehicle.nil? && slot.vehicle.color.eql?(color)
            slots << slot
          end
        end
      end

      slots
    end

    def slot_by_reg_no(reg_no)
      parking_levels.each do |level|
        level.parking_slots.each do |slot|
          if !slot.vehicle.nil? && slot.vehicle.reg_no.eql?(reg_no)
            return slot
          end
        end
      end
      nil
    end
  end
end
