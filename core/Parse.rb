#redo all this shit

class String
	def isDigit?
		self =~ /[[:digit:]]/ || false
	end

	def parse line_number
		line = self
		
		line.delete!(' ')
		line.upcase!

		state = :start
		index = 0

		label = line.extract_label line_number

		index = label.length unless label.nil?
		line = line[index..-1]

		variable = line.extract_variable line_number

		raise VariableMissingInInstructionError.new(line_number) if variable.nil?

		index = variable.length
		line = line[index..-1]

		instruction = line.extract_instruction_type line_number
		
		instruction.variable = variable
		instruction.label = label

		if instruction.class == GoToInstruction
			line = line[1..-1]
			instruction.label_2 = line.extract_label line_number
		end

		instruction
		# Que hacer si es goto....x`
		#instruction.label_2 = extract_label(line, line_number) if instruction.class == GoToInstruction
	end

	# Given a string that starts with a label of the form "[Ln]",
	# where L = "A",...,"E", and n is an integer,
	# returns a label object representing this label.
	def extract_label line_number
		state = :start
		letter = ""
		number = ""
		
		each_char do |c|
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
					raise LSyntaxError.new("Incorrect label syntax at line #{line_number}, expected label letter.")
				end
			when :letter
				if c.isDigit?
					number << c
				elsif c == "]"
					return label = Label.new(letter, number.to_i)
				else
					raise LSyntaxError.new("Incorrect label syntax at line #{line_number}, expected ']', but got #{c}.")
				end
			end
		end
	end


	def extract_variable line_number
		state = :start
		letter = ""
		number = ""
		
		each_char do |c|
			case state
			when :start
				if Variable::LETTERS.include? c
					letter = c
					state = :letter
				else
					raise LSyntaxError.new("Incorrect variable letter at line #{line_number}.")
				end
			when :letter
				if c.isDigit?
					number << c
				else
					number = "1" if number == ""
					return variable = Variable.new(letter, number)
				end
			end
		end
	end

	def extract_instruction_type line_number
		case self[0]
		when Instruction::INCREMENT
			IncrementInstruction.new
		when Instruction::DECREMENT
			DecrementInstruction.new
		when Instruction::GOTO
			GoToInstruction.new
		end
	end


end