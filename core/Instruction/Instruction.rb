class Instruction
	attr_accessor :label, :variable, :goto_label
	attr_reader :id

	INCREMENT, DECREMENT, GOTO  = "+", "-", "?"

	#guardar instrucciones segund orden de aparicion en input.
	@@instructions = Array.new
	@@program_counter = 0

	def initialize(goto_label = nil)
		@id = @@instructions.length
		@@instructions[@id] = self
		@goto_label = goto_label
	end

	def execute
    puts "Executing #{self}"
		goto_label
	end

	def to_s
		"Label: #{label}. Variable: #{variable}"
	end

	def inspect
		"@id=#{@id}, [#{label}]#{variable}"
	end
end

class Instruction
	class << self
		def all
			InstructionList.new(@@instructions.dup)
		end

		def find id
			@@instructions[id]
		end

		def find_by_label label
			@@instructions.find { |instruction| instruction.label == label }
		end
	end
end
