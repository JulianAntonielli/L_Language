class Variable
	attr_reader :letter, :number, :value

	LETTERS = ["X", "Y", "Z"]

	@@variables ||= {}

	class << self
		def get(letter, number = 1)
			sym = (letter.to_s + number.to_s).to_sym # Find a way to factor this out
			@@variables[sym]
		end

		def all
			@@variables.dup
		end
	end

	def initialize(letter, number = 1, value = 0)
		@letter = letter.freeze
		@number = number
		@value = value

		#raise ArgumentError unless @@variables[sym].nil?

		@@variables[sym] = self
	end

	def zero?
		value.zero?	
	end

	def increment
		@value += 1		
	end

	def decrement
		@value -= 1 unless value.zero?
	end

	def to_s
		letter + number.to_s
	end

	def length
		to_s.length
	end

	def == v
		@letter == v.letter && @number == v.number
	end

	def inspect
		to_s
	end

	private

	def sym
		(letter.to_s + number.to_s).to_sym
	end

end
