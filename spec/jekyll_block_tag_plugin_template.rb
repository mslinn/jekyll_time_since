# frozen_string_literal: true

require "key_value_parser"
require "jekyll"
require "shellwords"
require_relative "../lib/jekyll_block_tag_plugin_template"

RSpec.describe(JekyllPluginBlockTagTemplate) do
  include JekyllPluginBlockTagTemplate

  argv = Shellwords.split "param1=value1 param2='value2' param3=\"value3\""
  parser = KeyValueParser.new

  it "parses arguments" do
    options = parser.parse(argv)
    expect(options[:param1]).to eq("value1")
    expect(options[:param2]).to eq("value2")
    expect(options[:param3]).to eq("value3")
  end
end
