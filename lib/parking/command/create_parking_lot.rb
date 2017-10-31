module Command
  class CreateParkingLot < BasicCommand
    def execute(object, opts={})
      Parking::ParkingLot.new(slots: opts[:slots].to_i)
    end
  end
end
