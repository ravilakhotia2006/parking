module Parking
  class ParkingSlot
    attr_accessor :vehicle,
                  :slot_no,
                  :available

    def clear
      @vehicle = nil
      @available = true
    end

    def assign(vehicle)
      @vehicle = vehicle
      @available = false
    end

    def available?
      @available
    end
  end
end