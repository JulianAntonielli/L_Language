class GoToInstruction < Instruction
  def execute
    return nil if variable.zero?
    super
  end

  def to_s
    "#{super}, type: Goto. goto_label: #{goto_label}"
  end

  def inspect
    "[#{super}#{Instruction::GOTO}#{goto_label}]"
  end
end
