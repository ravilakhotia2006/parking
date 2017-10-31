module Command
  class BasicCommand
    def execute(opts={})
      raise NotImplementedError
    end
  end
end