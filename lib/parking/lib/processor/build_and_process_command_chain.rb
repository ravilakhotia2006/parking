# This class is used for stacking up commands such that
# resultant object from each command can be passed on to the next one

module Processor
  class BuildAndProcessCommandChain
    def initialize(stack)
      @stack = stack
      @chain = build_chain
    end

    def start(initial_object)
      @chain.inject(initial_object) do |object, curr|
        curr.call(object)
      end
    end

    def build_chain
      chain = []

      @stack.each do |command|
        klass, _args = command

        if klass.class.eql?(Class) && klass.new.respond_to?(:execute)
          chain << ->(object) { klass.new.execute(object) }
        elsif klass.respond_to?(:execute)
          chain << ->(object) { klass.execute(object) }
        else
          raise "#{klass} does not implement \'call\' which is required for Chain of Responsibility pattern to work."
        end
      end

      chain
    end
  end
end
