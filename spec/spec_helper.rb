# frozen_string_literal: true

require "jekyll"
require_relative "../lib/jekyll_block_tag_plugin_template"

Jekyll.logger.log_level = :info

work_dir = "/tmp/jekyll_block_tag_plugin_template"
RSpec.configure do |config|
  config.after(:suite) do
    FileUtils.rm_rf(work_dir)
  end
  config.before(:suite) do
    FileUtils.cp_r "spec/data", work_dir, :verbose => true
  end
  config.filter_run :focus
  config.order = "random"
  config.run_all_when_everything_filtered = true
end
