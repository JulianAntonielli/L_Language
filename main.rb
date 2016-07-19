require_relative 'utils'


lines = ["[A1]   X2131   +", "[B3]Z1-"]

puts "Lines input: "
lines.each { |line| puts line}



i = -1
instructions = lines.map do |line|
 i += 1
 line.parse i
end

puts "Parsed:"
instructions.each { |inst| puts inst}
