# frozen_string_literal: true

require_relative 'lib/jekyll_block_tag_plugin_template/version'

Gem::Specification.new do |spec|
  spec.name = 'jekyll_block_tag_plugin_template'
  spec.version = JekyllBlockTemplate::VERSION
  spec.authors = ['Firstname Lastname']
  spec.email = ['email@email.com']

  spec.summary = 'Write a short summary, because RubyGems requires one.'
  spec.description = <<~END_OF_DESC
    Write a longer description or delete this line.
  END_OF_DESC
  spec.homepage = 'https://github.com/username/jekyll_block_tag_plugin_template'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'debase'
  spec.add_development_dependency 'jekyll', '>= 3.5'
  spec.add_development_dependency 'rubocop-jekyll', '~> 0.12.0'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'ruby-debug-ide'
end
