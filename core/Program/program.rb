class Program
	attr_accessor :snapshots_on
	attr_reader :instruction_pointer, :instructions

	def initialize(instructions = nil, options = {})
		@snapshots_on = options[:snapshots_on]
		@instructions = instructions
		@instruction_pointer = 0
	end

	def run
		puts "[STARTING PROGRAM]"
		while(instruction_pointer < instructions.length)
			instruction = instructions[instruction_pointer]
			goto_label = instruction.execute

			if goto_label.nil?
				@instruction_pointer += 1
			else
				@instruction_pointer = find_index_by_label(goto_label)
			end

			print_snapshots if snapshots_on
			break if finished_running?
		end
		puts "[PROGRAM FINISHED]"
		puts "\nResults"
		print_snapshots
	end

	private 

	def find_index_by_label(label)
		instructions.find_index { |instruction| instruction.label == label }
	end

	def finished_running?
		instruction_pointer.nil? || instruction_pointer >= instructions.length
	end

	def print_snapshots
		puts "Variables:"
		variables.each { |variable| puts "#{variable}\t:\t#{variable.value}" }
	end

	def variables
		instructions.variables
	end
end
