class FileParser
  def initialize(file)
    File.open(file).each do |line|
      lines << line
    end
  end

  def lines
    @lines ||= []
  end

  def process
    stack = build_command_stack

    command_chain = Processor::CommandProcessor.new do |chain|
      stack.each { |item| chain.add *item }
    end

    command_chain.process(nil)
  end

  private

  def command_with_params_name
    {
      create_parking_lot: [:slots],
      park: [:reg_no, :color],
      leave: [:slot_no],
      status: [],
      registration_numbers_for_cars_with_colour: [:color],
      slot_numbers_for_cars_with_colour: [:color],
      slot_number_for_registration_number: [:reg_no]
    }
  end

  def class_name_from command
    name = command.split('_').map! { |word| word.capitalize }.join('')
    Kernel.const_get("Command::#{name}")
  end

  def args_from command_with_args
    args_name = command_with_params_name[command_with_args[0].to_sym]

    count = 0

    command_with_args[1..-1].inject({}) do |hash, value|
      hash[args_name[count]] = value
      count += 1

      hash
    end
  end

  def build_command_stack
    command_stack = []

    lines.each do |line|
      command_with_args = line.split(' ')
      command_class_name = class_name_from command_with_args[0]
      args_hash = args_from command_with_args

      command_stack << [command_class_name, args_hash]
    end

    command_stack
  end
end