require_relative 'utils'

module Shell
	@line_number = 1

	def start
		loop do
			begin
				print "ill:#{line_number}>"
				input_line = gets.chomp
				instruction = input_line.parse @line_number
				puts instruction
			rescue Exception => e 		#catch exceptions and do smth
				puts "Your last expression raised an error"
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