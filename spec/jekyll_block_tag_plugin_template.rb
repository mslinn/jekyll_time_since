# frozen_string_literal: true

require "key_value_parser"
require "jekyll"
require "shellwords"
require_relative "../lib/jekyll_block_tag_plugin_template"

RSpec.describe(JekyllPluginBlockTagTemplate) do
  include JekyllPluginBlockTagTemplate

  argv = Shellwords.split "param0 param1=value1 param2='value2' param3=\"value3\""

  it "parses arguments" do
    options = KeyValueParser.new.parse(argv)
    expect(options[:param0]).to eq(true)
    expect(options[:param1]).to eq("value1")
    expect(options[:param2]).to eq("value2")
    expect(options[:param3]).to eq("value3")
  end
end
