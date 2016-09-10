class Variable
	attr_reader :letter, :number, :value

	LETTERS = ["X", "Y", "Z"]
	#poner constantes.
	@@variables = Hash.new

	def self.new letter, number = 1
		#validar cosas!
		sym = (letter + number.to_s).to_sym
		@@variables[sym] = super(letter, number) if @@variables[sym].nil?
		
		@@variables[sym]

	end

	def initialize letter, number
		@letter = letter
		@number = number
		@value = 0
	end

	def self.get letter, number
		sym = (letter + number.to_s).to_sym
		@@variables[sym]
	end

	def == v
		@letter == v.letter && @number == v.number
	end

	def increment
		@value += 1		
	end

	def decrement
		@value -= 1 unless value == 0
	end

	def to_s
		letter + number.to_s
	end

	def length
		to_s.length
	end

	def self.all
		@@variables
	end

	private :initialize
end