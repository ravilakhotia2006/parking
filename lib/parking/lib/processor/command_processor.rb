# This is an implementation of Command Processor using Chain Of Responsibility design pattern
# for more details on what the pattern is : https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern
#
# All the Command should respond to :execute which process the request
#
# class Park
#   def execute(object, args={})
#   # some processing
#   # return processed_object
#   end
# end
#
# class CreateParkingLot
#   def execute(object, args={})
#   # some processing
#   # return processed_object
#   end
# end
#
# Usage:
#
#   stack = Processor::CommandProcessor.new do |chain|
#     chain.add CreateParkingLot args
#     chain.add Park args
#   end
#
#   stack.process(object)
#
#

module Processor
  class CommandProcessor
    attr_accessor :stack

    def initialize(_args = {}, &block)
      @stack = []
      instance_eval(&block) if block_given?
    end

    def add(command, args = {})
      @stack << [command, args]
    end

    def process(object)
      runner.start(object)
    end

    def runner
      BuildAndProcessCommandChain.new(@stack)
    end
  end
end
