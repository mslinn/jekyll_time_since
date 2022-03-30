# frozen_string_literal: true

require "fileutils"
require "jekyll"
require "key_value_parser"
require "shellwords"
require_relative "../lib/jekyll_block_tag_plugin_template"

RSpec.describe(Jekyll::MyBlock) do
  include Jekyll::MyBlock

  it "parses arguments" do
    argv = Shellwords.split "param0 param1=value1 param2='value2' param3=\"value3\""
    options = KeyValueParser.new.parse(argv)
    # puts options.map { |k, v| "#{k} = #{v}" }.join("\n")

    expect(options[:param0]).to eq(true)
    expect(options[:param1]).to eq("value1")
    expect(options[:param2]).to eq("value2")
    expect(options[:param3]).to eq("value3")
    expect(options[:unknown]).to be_nil
  end
end
