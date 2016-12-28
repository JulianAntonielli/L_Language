class DecrementInstruction < Instruction
  def execute
    decrement
    super
  end

  def to_s
    "#{super}, type: decrement"
  end

  def inspect
    "[#{super}#{Instruction::DECREMENT}]"
  end

  private

  def decrement
    variable.decrement
  end
end
