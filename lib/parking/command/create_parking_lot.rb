module Command
  class CreateParkingLot < BasicCommand
    def execute(object, opts={})
      puts "executing create parking lot command with opts #{opts}"
    end
  end
end
