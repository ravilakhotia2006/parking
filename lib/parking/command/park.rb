module Command
  class Park < BasicCommand
    def execute(lot, opts={})
      puts "executing park command with opts #{opts}"


      lot
    end
  end
end
