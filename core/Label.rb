class Label
	LETTERS = ["A", "B", "C", "D", "E"]
	attr_accessor :letter, :number

	def initialize letter, number
		if LETTERS.include? letter
			@letter = letter
			@number = number
		else
			raise LSyntaxError.new("Expected label letter, got #{letter}")
		end
	end

	def to_s
		"[#{@letter + @number.to_s}]"
	end

	def length
		3 + number.to_s.length
	end

	def == l
		@number == l.number && @letter == l.letter
	end

	def hash
		@number.hash
	end
	
	def eql? lab
		if lab.instance_of? Label	
			@number.eql?(lab.number) && @letter.eql?(lab.letter)
		else
			false
		end
	end	
end