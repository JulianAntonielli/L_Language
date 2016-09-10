class LSyntaxError < StandardError
end


class ExpectingVariableError < LSyntaxError
	def initialize line_num
		super "Error at line #{line_num}, variable name expected."
	end
end

class VariableMissingInInstructionError < LSyntaxError
end