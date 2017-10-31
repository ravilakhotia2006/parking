module Vehicle
  class Car < BaseVehicle

    def initialize(opts={})
      super(opts)
    end

    def type
      :car
    end
  end
end