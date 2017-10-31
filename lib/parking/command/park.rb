module Command
  class Park < BasicCommand
    def execute(opts={})
      puts "executing park command with opts #{opts}"
    end
  end
end
