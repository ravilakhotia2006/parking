module Command
  class Park < BasicCommand
    def execute(object, opts={})
      puts "executing park command with opts #{opts}"
    end
  end
end
