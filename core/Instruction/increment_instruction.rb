class IncrementInstruction < Instruction
  def execute
    increment
    super
  end

  def to_s
    "#{super}, type: increment"
  end

  def inspect
    "[#{super}#{Instruction::INCREMENT}]"
  end

  private

  def increment
    variable.increment
  end
end
