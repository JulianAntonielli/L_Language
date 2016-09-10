require_relative 'utils'
# Hacer constructores.


# should every instruction hold its index? 
class Instruction
	attr_accessor :label, :variable, :index
	
	INCREMENT, DECREMENT, GOTO  = "+", "-", "?"


	#guardar instrucciones segund orden de aparicion en input.
	@@instructions = Array.new
	@@index = 0
	@@program_counter = 0

	def initialize
		@@instructions[@@index] = self
		#giving instructions its index
		@index = @@index
		@@index += 1
	end

	def execute
		puts "Executing #{self}"
		@index + 1
	end


	def to_s
		"Label: #{label}. Variable: #{variable}"
	end

	def self.all
		@@instructions
	end

	def self.byLabel label
		#buscar como hacer mejor.
		instByLabel = {}
		@@instructions.each_with_index do |inst, index|
			instByLabel[inst.label] = index
		end
		
		@@instructions[instByLabel[label]]
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
		gotoInst = Instruction.byLabel @label_2
		puts "gotoinst : #{gotoInst}"
		Program.terminate if gotoInst.nil?

		gotoInst.index
	end
end