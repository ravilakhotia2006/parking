module Command
  class CreateParkingLot < BasicCommand
    def execute(object, opts={})
      Parking::ParkingLot.new(opts[:slots])
    end
  end
end
