require_relative 'utils'

module Shell
	
	@line_number = 1

	def start
		loop do
			print "ill:#{line_number}>"
			s = gets.chomp
			inst = s.parse @line_number
			puts inst
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