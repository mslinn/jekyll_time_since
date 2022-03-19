# frozen_string_literal: true

require "jekyll"
require_relative "../lib/jekyll_block_tag_plugin_template"

RSpec.describe(JekyllBlockTemplate) do
  include JekyllBlockTemplate

  it "verifies arithmetic" do
    expect(1 + 1).to eq(2)
  end
end
