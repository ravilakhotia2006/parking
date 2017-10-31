module Parking
  class ParkingLot
    include Query::ParkingLotQuery

    attr_accessor :parking_levels,
                  :num_levels,
                  :slots

    def initialize(opts={})
      raise "Number of slots should be an integer" unless opts[:slots].class.eql?(Fixnum)
      @slots = opts[:slots]

      initialize_parking_levels(opts[:slots])
    end

    def status
      puts "Slot No.\tRegistration No.\tColour\n"

      parking_levels.each do |level|
        level.parking_slots.each do |slot|
          unless slot.available?
            puts "#{slot.slot_no}\t#{slot.vehicle.reg_no}\t#{slot.vehicle.color}\n"
          end
        end
      end
    end

    def park(reg_no, color)
      parked = false

      parking_levels.each do |level|
        level.parking_slots.each do |slot|
          if slot.available?
            slot.assign(Vehicle::Car.new(reg_no: reg_no, color: color))
            parked = true

            puts "Allocated slot number: #{slot.slot_no}\n"
            break
          end
        end
      end

      puts "Sorry, parking lot is full\n" unless parked
    end

    def leave(slot_no)
      level = level_of(slot_no)

      puts "level #{level} for slot_no #{slot_no}"
      if slot_no < ParkingLevel.max_slots
        slot_in_level = slot_no
      else
        slot_in_level = slot_no - (level - 1) * ParkingLevel.max_slots
      end

      puts "slot in level #{slot_in_level}"
      slot = parking_levels[level_of(slot_no) - 1].parking_slots[slot_in_level - 1]
      slot.clear

      puts "Slot number #{slot.slot_no} is free\n"
    end

    def parking_levels
      @parking_levels ||= []
    end

    private

    def level_of(slot_no)
      slot_no / ParkingLevel.max_slots + 1
    end

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
