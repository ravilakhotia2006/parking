module Command
  class RegistrationNumbersForCarsWithColour < BasicCommand
    def execute(lot, opts={})
      slots = lot.slots_by_color(opts[:color])

      puts slots.map { |slot| slot.vehicle.reg_no }.join(', ')

      lot
    end
  end
end