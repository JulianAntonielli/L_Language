module Parser
	def parse line
		line.delete!(' ')
		line.upcase!

		state = :start
		index = 0

		label = extract_label line

		index = label.length unless label.nil?
		line = line[index..-1]

		variable = extract_variable line

		raise VariableMissingInInstructionError if variable.nil?

		index = variable.length

		line = line[index..-1]
		
		instruction = extract_instruction_type line
		
		instruction.variable = variable
		instruction.label = label

		if instruction.class == GoToInstruction
			line = line[1..-1]
			instruction.label_2 = extract_label line
		end

		instruction
		# Que hacer si es goto....x`
		#instruction.label_2 = extract_label(line, line_number) if instruction.class == GoToInstruction
	end

	# Given a string that starts with a label of the form "[Ln]",
	# where L = "A",...,"E", and n is an integer,
	# returns a label object representing this label.
	def extract_label line
		state = :start
		letter = ""
		number = ""
		
		line.each_char do |c|
			case state
			when :start
				if c == "["
					state = :open_label
				else
					return
				end
			when :open_label
				if Label::LETTERS.include? c
					letter = c
					state = :letter
				else
					raise LSyntaxError.new
				end
			when :letter
				if c.digit?
					number << c
				elsif c == "]"
					return label = Label.new(letter, number.to_i)
				else
					raise LSyntaxError.new
				end
			end
		end
	end

	def extract_variable line
		state = :start
		letter = ""
		number = ""
		
		line.each_char do |c|
			case state
			when :start
				if Variable::LETTERS.include? c
					letter = c
					state = :letter
				else
					raise LSyntaxError.new
				end
			when :letter
				if c.digit?
					number << c
				else
					number = "1" if number == ""
					return variable = Variable.new(letter, number)
				end
			end
		end
	end

	def extract_instruction_type line
		case line[0]
		when Instruction::INCREMENT
			IncrementInstruction.new
		when Instruction::DECREMENT
			DecrementInstruction.new
		when Instruction::GOTO
			GoToInstruction.new
		end
	end
end