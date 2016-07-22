class Variable
	INPUT_VARIABLE, LOCAL_VARIABLE, OUTPUT_VARIABLE = "X", "Z", "Y"
	LETTERS = [INPUT_VARIABLE, LOCAL_VARIABLE, OUTPUT_VARIABLE]
	
	attr_accessor :letter, :number, :value

	def self.new letter, number
		var = super(letter, number)

	end

	def initialize letter, number
		if LETTERS.include? letter
			@letter = letter
			@number = number
		else
			raise LSyntaxError.new("Expected variable letter, got #{letter}")
		end
	end

	def get(h)
		h[:letter] 
	end


	def to_s
		letter + number.to_s
	end

	def length
		1 + number.to_s.length
	end

	def == v
		@number == v.number && @letter == l.letter
	end


end