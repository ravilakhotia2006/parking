module Vehicle
  class BaseVehicle
    attr_reader :type
    attr_accessor :color,
                  :reg_no

    def initialize(opts={})
      @reg_no = opts[:reg_no] unless opts[:reg_no].nil?
      @color = opts[:color] unless opts[:color].nil?
    end
  end
end
