# frozen_string_literal: true

require_relative "jekyll_block_tag_plugin_template/version"
require "jekyll_logger_factory"

# This is the module-level description.
#
# @example Heading for this example
#   Describe what this example does
#   {% my_block_template "parameter" %}
#     Hello, world!
#   {% endmy_block_template %}
#
# The Jekyll log level defaults to :info, which means all the Jekyll.logger statements below will not generate output.
# You can control the log level when you start Jekyll.
# To set the log level to :debug, pass the --verbose option, like this:
#   bundle exec jekyll build --verbose
#   JEKYLL_ENV=development bundle exec jekyll serve --verbose
# To set the log level to :error, pass the --quiet option, like this:
#   bundle exec jekyll build --quiet
#   JEKYLL_ENV=development bundle exec jekyll serve --quiet

module JekyllBlockTagTemplate
  # This class implements the Jekyll tag functionality
  class MyBlock < Liquid::Block
    # Constructor.
    # @param tag_name [String] the name of the tag, which we already know.
    # @param text [Hash, String, Liquid::Tag::Parser] the arguments from the tag.
    # @param tokens [Liquid::ParseContext] parsed and tokenized command line
    # @return [void]
    def initialize(tag_name, arguments, tokens)
      super
      MyBlock.logger = LoggerFactory.new("my_block_template", site.config)
      Jekyll.logger.debug <<~HEREDOC
        tag_name [#{tag_name.class}] = '#{tag_name}' [#{tag_name.class}]
        arguments [#{arguments.class}] = '#{arguments}'
      HEREDOC
      @arguments = arguments
      @arguments = "" if @arguments.nil? || @arguments.empty?
    end

    # Method prescribed by the Jekyll plugin lifecycle.
    # @return [String]
    def render(context)
      content = super # This underdocumented assignment returns the text within the block.

      @site = context.registers[:site]
      @config = @site.config
      @mode = @config["env"]["JEKYLL_ENV"]
      @page = context.registers[:page]

      Jekyll.logger.debug <<~HEREDOC
        mode='#{@mode}'
        page.path='#{@page.path}'
        page.url='#{@page.url}'
      HEREDOC

      # Compute the return value of this Jekyll tag
      <<~HEREDOC
        <p style="color: green; background-color: yellow; padding: 1em; border: solid thin grey;">
          #{content}
        </p>
      HEREDOC
    end

    private

    # Your private methods go here
  end
end

Liquid::Template.register_tag(JekyllBlockTagTemplate::MyBlock.logger.progname, JekyllBlockTemplate::MyBlock)
