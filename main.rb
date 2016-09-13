require_relative 'core/utils'

if ARGV.size.zero?
	Shell.start
else
	program_path = ARGV[0]
	if File.file? program_path
		p = Program.parse_from_file File.open(program_path)
	end

	if ARGV[1] == '-s'
		p.snapshots_on = true
	end

	p.run
end


=begin
i = 0
loop do
	line = gets.chomp
	inst = line.parse i
	puts inst
	i += 1
end

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

#Shell.start

