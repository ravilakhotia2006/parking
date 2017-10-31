module Command
  class BasicCommand
    def execute(object, opts={})
      raise NotImplementedError
    end
  end
end