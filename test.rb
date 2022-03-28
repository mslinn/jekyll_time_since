# frozen_string_literal: true

require "key_value_parser"

command_line = "param1=value1 param2='value2' param3=\"value3\""

options = KeyValueParser.new.parse(command_line)
puts options
