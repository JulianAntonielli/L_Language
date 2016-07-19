class Instruction
	INCREMENT, DECREMENT, GOTO  = "+", "-", "?"

	attr_accessor :label, :variable

	def to_s
		"Label: #{label}. Variable: #{variable}"
	end
end


class IncrementInstruction < Instruction
	def to_s
		"#{super}, type: increment"
	end

end

class DecrementInstruction < Instruction
	def to_s
		"#{super}, type: decrement"
	end
end

class GoToInstruction < Instruction
	attr_accessor :label_2

	def to_s
		"#{super}, type: goto label #{label_2}"
	end

end