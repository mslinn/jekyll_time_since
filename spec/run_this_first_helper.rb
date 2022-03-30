# frozen_string_literal: true

load "bin/run_this_first"

work_dir = "/tmp/jekyll_block_tag_plugin_template"
RSpec.configure do |config|
  config.after(:suite) do
    FileUtils.rm_rf(work_dir)
  end
  config.before(:suite) do
    FileUtils.cp_r "spec/run_this_first_data", work_dir, :verbose => true
  end
  config.filter_run :focus
  config.order = "random"
  config.run_all_when_everything_filtered = true

  # See https://manny.codes/7-ways-to-selectively-run-rspec-tests/#5-running-only-failing-tests
  config.example_status_persistence_file_path = "spec/status_persistence.txt"
end
