`jekyll_block_template`
[![Gem Version](https://badge.fury.io/rb/jekyll_block_template.svg)](https://badge.fury.io/rb/jekyll_block_template)
===========

This is a Jekyll plugin that provides a new Liquid tag called `new_tag_name` and a new tag block called `new_tag_block_name`.

 * A `new_tag_block_name` block tag that can do magic with its eyes closed.
   ```
   {% new_tag_name [arguments] %}
   Contents of new_tag_block_name
   {% endnew_tag_name %}
   ```
 * A `new_tag_name` tag that can turn on a dime and leave 15 cents change.
   ```
   {% new_tag_name [arguments]%}Contents of new_tag_name tag
   ```

## Additional Information
More information is available on my web site about
[my Jekyll plugins](https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll_block_template'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_block_template


## Usage

TODO: Write usage instructions here


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Install development dependencies like this:
```
$ BUNDLE_WITH="development" bundle install
```

To install this gem onto your local machine, run:
```shell
$ bundle exec rake install
```

To release a new version,
  1. Update the version number in `version.rb`.
  2. Commit all changes to git; if you don't the next step might fail with an unexplainable error message.
  3. Run the following:
     ```shell
     $ bundle exec rake release
     ```
     The above creates a git tag for the version, commits the created tag,
     and pushes the new `.gem` file to [RubyGems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/git_user_name/jekyll_block_template.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
