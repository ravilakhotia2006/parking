module Command
  class Status < BasicCommand
    def execute(lot, opts={})
      lot.status if lot.respond_to?(:status)
    end
  end
end
