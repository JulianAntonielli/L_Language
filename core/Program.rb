# Class representing a program
#
# Given an ordered set of instructions
# it can run them.

## This should be a singleton class?

# It works!
class Program

	def self.parse_from_file file
		instructions = []
		file.each do |line|
			instructions << Instruction.parse line
		end
	end



	def self.terminate
	end

	def initialize instructions = nil
		@instructions = instructions
	end

	def load instructions
		#if me pasan un archivo hacer cosas.
		#si me pasan un string, hacer otras.
		#si me pasan un array de instrucciones, @instructions = instructions
	end
	def run
		instructions = @instructions

		running = true
		index = 0
		
		running = false if instructions.nil?
		while running
			index = instructions[index].execute
			running = false if instructions[index].nil?
			sleep 1
			puts "\nVariables:"
			vars = Variable.all.each {|k,v| puts "#{v}\t:\t#{v.value}"}

		end
	end
end