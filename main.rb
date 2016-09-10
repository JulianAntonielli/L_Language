require_relative 'core/utils'

unless ARGV.size.zero?
	program_path = ARGV[0]
	if File.file? program_path
		Program.parse_from_file program_path
	end
end 

=begin
i = 0
loop do
	line = gets.chomp
	inst = line.parse i
	puts inst
	i += 1
end
=end


=begin
lines = ["[A1]   X1   +", "[B3]Z1+", "[C3]X2?[B3]" ]

puts "Lines input: "
lines.each { |line| puts "\t#{line}"}

i = 0
instructions = lines.map do |line|
 i += 1
 line.parse i
end

puts "\nParsed:"
instructions.each { |inst| puts inst}

puts "\nVariables found:"
vars = Variable.all.each {|k,v| puts "#{v}\t:\t#{v.value}"}

program = Program.new instructions
program.run

puts "\nExecuting instructions..."
=end

Shell.start

