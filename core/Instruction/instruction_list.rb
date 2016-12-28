require_relative 'instruction'

class Instruction::InstructionList
  def initialize(instructions)
    @instructions = instructions
  end

  def inspect
    @instructions.inspect
  end

  def [](index)
    @instructions[index]
  end

  def variables
    @variables ||= @instructions.map { |instruction| instruction.variable }.uniq
  end

  def length
    @instructions.length
  end

  def method_missing(name, *args)
    super unless @instructions.respond_to? name
    @instructions.send(name, args)
  end
end
