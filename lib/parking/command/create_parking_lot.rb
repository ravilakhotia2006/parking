module Command
  class CreateParkingLot < BasicCommand
    def execute(opts={})
      puts "executing create parking lot command with opts #{opts}"
    end
  end
end
