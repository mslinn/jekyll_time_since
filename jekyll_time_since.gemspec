require_relative 'lib/jekyll_time_since/version'

Gem::Specification.new do |spec|
  github = 'https://github.com/mslinn/jekyll_time_since'

  spec.authors = ['Michael Slinn']
  spec.bindir = 'exe'
  spec.description = <<~END_OF_DESC
    jekyll_time_since is a Jekyll plugin that provides new Liquid tags called years_since, months_since, days_since, hours_since, minutes_since and seconds_since.
  END_OF_DESC
  spec.email = ['email@email.com']

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['.rubocop.yml', 'LICENSE.*', 'Rakefile', '{lib,spec}/**/*', '*.gemspec', '*.md']

  spec.homepage = 'https://www.mslinn.com/jekyll_plugins/jekyll_time_since.html'
  spec.license = 'MIT'
  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'bug_tracker_uri'   => "#{github}/issues",
    'changelog_uri'     => "#{github}/CHANGELOG.md",
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => github,
  }
  spec.name = 'jekyll_time_since'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.6.0'
  spec.summary = 'jekyll_time_since is a Jekyll plugin that provides new Liquid tags called years_since, months_since, days_since, hours_since, minutes_since and seconds_since.'
  spec.version = JekyllTimeSinceVersion::VERSION

  spec.add_dependency 'jekyll', '>= 3.5.0'
  spec.add_dependency 'jekyll_plugin_logger'
end
