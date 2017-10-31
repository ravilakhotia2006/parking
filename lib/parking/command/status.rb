module Command
  class Status < BasicCommand
    def execute(lot, opts={})
      lot.status if object.respond_to?(:status)
    end
  end
end
