# frozen_string_literal: true

require "jekyll_plugin_logger"
require "key_value_parser"
require "shellwords"
require_relative "jekyll_block_tag_plugin_template/version"

module JekyllPluginBlockTagTemplate
  PLUGIN_NAME = "block_tag_template"
end

# This is the module-level description.
#
# @example Heading for this example
#   Describe what this example does
#   {% block_tag_template "parameter" %}
#     Hello, world!
#   {% endblock_tag_template %}
#
# The Jekyll log level defaults to :info, which means all the Jekyll.logger statements below will not generate output.
# You can control the log level when you start Jekyll.
# To set the log level to :debug, pass the --verbose option, like this:
#   bundle exec jekyll build --verbose
#   JEKYLL_ENV=development bundle exec jekyll serve --verbose
# To set the log level to :error, pass the --quiet option, like this:
#   bundle exec jekyll build --quiet
#   JEKYLL_ENV=development bundle exec jekyll serve --quiet

module Jekyll
  # This class implements the Jekyll tag functionality
  class MyBlock < Liquid::Block
    # @param tag_name [String] the name of the tag, which we already know.
    # @param argument_string [String] the arguments from the tag, as a single string.
    # @param _parse_context [Liquid::ParseContext] Liquid variables name/value pairs accessible in the calling page
    #        See https://www.rubydoc.info/gems/liquid/Liquid/ParseContext
    # @return [void]
    def initialize(tag_name, argument_string, _parse_context)
      super
      @logger = PluginMetaLogger.instance.new_logger(self)
      # @logger.level = "debug" # Comment this line for production; it overrides any value in _config.yml

      argv = Shellwords.split argument_string # Parses arguments like Posix shells do
      params = KeyValueParser.new.parse(argv) # extract key/value pairs, default value for non-existant keys is nil
      @param1 = params[:param1] # Example of obtaining the value of parameter param1
      @param_x = params[:not_present] # The value of parameters that are present is nil, but displays as the empty string

      @logger.debug do
        <<~HEREDOC
          tag_name = '#{tag_name}'
          argument_string = '#{argument_string}'
          @param1 = '#{@param1}'
          @param_x = '#{@param_x}'
          params =
            #{params.map { |k, v| "#{k} = #{v}" }.join("\n  ")}
        HEREDOC
      end
    end

    # Method prescribed by the Jekyll plugin lifecycle.
    # @return [String]
    def render(context)
      content = super # This underdocumented assignment returns the text within the block.

      @site = context.registers[:site]
      @config = @site.config
      @mode = @config["env"]["JEKYLL_ENV"]
      @page = context.registers[:page]

      @logger.debug <<~HEREDOC
        mode="#{@mode}"
        page.path="#{@page.path}"
        page.url="#{@page.url}"
      HEREDOC

      # Compute the return value of this Jekyll tag
      <<~HEREDOC
        <p style="color: green; background-color: yellow; padding: 1em; border: solid thin grey;">
          #{content}
        </p>
      HEREDOC
    end

    private # Your private methods go here
  end
end

PluginMetaLogger.instance.info { "Loaded #{JekyllPluginBlockTagTemplate::PLUGIN_NAME} v#{JekyllBlockTagTemplate::VERSION} plugin." }
Liquid::Template.register_tag(JekyllPluginBlockTagTemplate::PLUGIN_NAME, Jekyll::MyBlock)
