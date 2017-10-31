module Command
  class Park < BasicCommand
    def execute(lot, opts={})
      lot.park!(opts[:reg_no], opts[:color])
    end
  end
end
