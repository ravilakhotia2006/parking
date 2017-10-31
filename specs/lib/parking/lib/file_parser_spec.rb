require_relative '../../../spec_helper'

describe FileParser do
  before(:all) do
    puts Dir.pwd
    @file = 'input.txt'
  end

  describe '#new' do
    it 'should add lines for bulk parsing' do
      parser = FileParser.new(@file)

      expect(parser.bulk_input).to eq true
    end

    it 'should not lines when not bulk parsing' do
      parser = FileParser.new

      expect(parser.bulk_input).to eq false
    end
  end

  describe '#process' do
    it 'should process bulk input for lines' do
      parser = FileParser.new(@file)

      parser.process

      # expect_any_instance_of(Processor::CommandProcessor).to receive(:process).once
      expect(parser.bulk_input).to eq true
    end

    it 'should process single line input' do
      parser = FileParser.new

      parser.process

      expect(parser.bulk_input).to eq false
    end

    it 'should raises exception for unkown command' do
      parser = FileParser.new('specs/support/wrong_command.txt')

      expect { parser.process }.to_not raise_error
    end
  end
end