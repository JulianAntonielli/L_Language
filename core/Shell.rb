require_relative 'instruction'

module Shell
	@line_number = 1

	def start
		loop do
			begin
				print "ill:#{line_number}>"
				line = gets.chomp
				instruction = Instruction.parse line
				puts instruction
			rescue Exception => e 		#catch exceptions and do smth
				raise e
			end
			@line_number += 1
		end
	end

	def line_number
		@line_number ||= 1
	end
end

class Object
	prepend Shell
end
