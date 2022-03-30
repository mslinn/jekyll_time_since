# frozen_string_literal: true

require "key_value_parser"

options = KeyValueParser.new.parse(ARGV)
puts options

old_variable_name = "blah"
