# frozen_string_literal: true

require "fileutils"
require "jekyll"
require "key_value_parser"
require "shellwords"
require_relative "../lib/jekyll_block_tag_plugin_template"

RSpec.describe(JekyllPluginBlockTagTemplate) do
  include JekyllPluginBlockTagTemplate
  load "bin/run_this_first"

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

  xit "rename_identifiers" do
    run_this_first = RunThisFirst.new(work_dir)
    run_this_first.rename_identifiers("old_variable_name", "new_variable_name")

    gemspec = File.read("old_name.gemspec")
    expect(gemspec).to include <<~BLAH
      require_relative "lib/new_name/version"

      Gem::Specification.new do |spec|
        github = "https://github.com/mslinn/new_name"
        spec.name = "new_name"
        spec.version = NewNameVersion::VERSION
      end
    BLAH

    version_rb = File.read("old_name/old_name/version.rb")
    expect(version_rb).to include("class NewName")

    old_name_rb = File.read("old_name/old_name/old_name.rb")
    expect(old_name_rb).to include("new_name")
  end

  xit "rename_files" do
    run_this_first = RunThisFirst.new(work_dir)
    run_this_first.rename_files("old_name", "new_name")
    expect(Dir["."]).to match_array[
      "new_name.gemspec",
      "lib/new_name.rb",
      "lib/new_name/new_name.rb",
      "lib/new_name/version.rb"
    ]
  end
end
