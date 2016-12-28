require_relative 'core/Instruction/instruction'
require_relative 'core/Instruction/instruction_list'
require_relative 'core/Parser/parser'
require_relative 'core/Program/program'
require 'pry'

def get_file_name
	print 'Enter File name: '
	gets.chomp
end

def parse_options(options)
	raise "Wrong number of options" unless options.length.even?
	
	Hash[* options.each_with_index.map {|e,i| i.odd? ? e == 'true' : e.chop.to_sym }]
end

def run_program_from_file(file_path, options = {})
	file = File.open(file_path)
	instructions = Parser.extract_instructions_from_file(file)
	file.close
	instruction_list = Instruction::InstructionList.new(instructions)
	puts "Instruction list:"
	puts instruction_list.inspect
	program = Program.new(instruction_list, options)
	program.run
end

def parse_arguments
	if ARGV.empty?
		file_path = get_file_name
		options = { snapshots_on: true }
	else
		file_path = ARGV.shift
		options = parse_options(ARGV)
	end

	[file_path, options]
end

file_path, options = parse_arguments
#puts options.inspect
#exit!

run_program_from_file(file_path, options)


#run_program_from_file('example_program.txt', snapshots_on: true)
#/Users/jant/L_Language/example_program.txt
#example_program.txt
#example_program.txt
#'./example_program.txt'
# if ARGV.size.zero?
# 	Shell.start
# else
# 	program_path = ARGV[0]
# 	if File.file? program_path
# 		p = Program.parse_from_file File.open(program_path)
# 	end

# 	if ARGV[1] == '-s'
# 		p.snapshots_on = true
# 	end

# 	p.run
# end


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

