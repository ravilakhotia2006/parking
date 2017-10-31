module Parking
  class ParkingLot
    attr_accessor :parking_levels,
                  :num_levels,
                  :slots

    def initialize(opts={})
      raise "Number of slots should be an integer" unless opts[:slots].class.eql?(Fixnum)
      @slots = opts[:slots]

      initialize_parking_levels(opts[:slots])
    end

    def status
    end

    def park
    end

    def leave
    end

    def parking_levels
      @parking_levels ||= []
    end

    private

    def initialize_parking_levels(num)
      if num > ParkingLevel.max_slots
        @num_levels = num / ParkingLevel.max_slots + 1

        slots_assigned = 0

        @num_levels.times do |level|
          if level.eql?(0)
            slots = 30
            slots_assigned = 30
          else
            slots = num - slots_assigned
            slots = ParkingLevel.max_slots if slots >= ParkingLevel.max_slots
            slots_assigned += slots
          end

          parking_levels << ParkingLevel.new(level_no: level + 1, slots_num: slots)
        end
      else
        @num_levels = 1
        parking_levels << ParkingLevel.new(level_no: 1, slots_num: num)
      end
    end
  end
end
