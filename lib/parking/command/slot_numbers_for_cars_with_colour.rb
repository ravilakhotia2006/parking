module Command
  class SlotNumbersForCarsWithColour < BasicCommand
    def execute(lot, opts={})
      slots = lot.slots_by_color(opts[:color])

      puts slots.map { |slot| slot.slot_no }.join(', ')
      lot
    end
  end
end