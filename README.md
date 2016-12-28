# L_Language

Definitions: 

A label is a string of the form "[Mn]" where M is one of "A",...,"E", and n is an integer.

A variable is either the string "Y", or a  of the form Wn, where W is one of "X", "Z" a

## Usage

Run `ruby main.rb [program_file_path] [options]` to run the program `program_file_path`, options must be passed in the format `key1: value1 key2: value2`, and so on. Currently accepted options are:

-  `snapshots_on: true/false`: Print variables' state after each instruction. Default is false. 
