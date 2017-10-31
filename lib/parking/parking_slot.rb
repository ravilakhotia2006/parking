module Parking
  class ParkingSlot
    attr_accessor :vehicle,
                  :slot_no,
                  :available

    def initialize(opts={})
      if opts[:slot_no].nil?
        raise 'Slot No needed to initialize a slot'
      end

      @slot_no = opts[:slot_no]

      if opts[:vehicle].nil?
        @available = true
      else
        @available = false
        @vehicle = opts[:vehicle]
      end
    end

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