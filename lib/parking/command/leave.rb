module Command
  class Leave < BasicCommand
    def execute(lot, opts={})
      lot.leave!(opts[:slot_no].to_i)
    end
  end
end