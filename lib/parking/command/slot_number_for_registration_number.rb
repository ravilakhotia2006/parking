module Command
  class SlotNumberForRegistrationNumber < BasicCommand
    def execute(lot, opts={})
      slot = lot.slot_by_reg_no(opts[:reg_no])

      if slot.nil?
        puts "Not Found\n"
      else
        puts slot.slot_no
      end

      lot
    end
  end
end