module Vehicle
  class Car < BaseVehicle

    def initialize(opts={})
      super(opts)
    end

    def type
      :car
    end

    def color=(c)
      @color = c.downcase.to_sym
    end
  end
end