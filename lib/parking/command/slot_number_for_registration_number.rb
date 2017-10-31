module Command
  class SlotNumberForRegistrationNumber < BasicCommand
    def execute(lot, opts={})
      slot = lot.slot_by_reg_no(opts[:reg_no])
      puts slot.slot_no

      lot
    end
  end
end