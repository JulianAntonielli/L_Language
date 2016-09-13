require_relative 'parse'
# Hacer constructores.

# should every instruction hold its index? 
class Instruction
	attr_accessor :label, :variable, :id
	extend Parser
	
	INCREMENT, DECREMENT, GOTO  = "+", "-", "?"

	#guardar instrucciones segund orden de aparicion en input.
	@@instructions = Array.new
	@@index = 0
	@@program_counter = 0

	def initialize
		@@instructions[@@index] = self
		#giving instructions its index
		@id = @@index
		@@index += 1
	end

	def execute
		puts "Executing #{self}"
		@id + 1
	end

	def to_s
		"Label: #{label}. Variable: #{variable}"
	end

	def self.find id
		@@instructions[id]
	end

	def self.all
		@@instructions
	end

	def self.by_label label
		#buscar como hacer mejor.
		@@instructions.find { |instruction| instruction.label == label }
	end

end

class IncrementInstruction < Instruction
	def to_s
		"#{super}, type: increment"
	end

	def execute
		variable.increment
		super
	end
end

class DecrementInstruction < Instruction
	def to_s
		"#{super}, type: decrement"
	end

	def execute
		variable.decrement
		super
	end
end

class GoToInstruction < Instruction
	attr_accessor :label_2

	def to_s
		"#{super}, type: goto label #{label_2}"
	end

	def execute
		puts "Executing #{self}"
		goto_inst = Instruction.by_label @label_2
		puts "gotoinst : #{goto_inst}"
		Program.terminate if goto_inst.nil?
		goto_inst.id
	end
end