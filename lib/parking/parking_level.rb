module Parking
  class ParkingLevel
    attr_accessor :level_no,
                  :parking_slots

    def initialize(opts={})
      @level_no = opts[:level_no]
      initialize_parking_slots(opts[:slots_num])
    end

    def self.max_slots
      30
    end

    def parking_slots
      @parking_slots ||= []
    end

    def empty_slots
    end

    def add_slot
    end

    def initialize_parking_slots(slot_num)
      start = (@level_no - 1) * ParkingLevel.max_slots + 1

      slot_num.times do |num|
        parking_slots << ParkingSlot.new(slot_no: start + num)
      end
    end
  end
end
