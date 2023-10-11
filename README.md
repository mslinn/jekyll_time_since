# `jekyll_time_since` [![Gem Version](https://badge.fury.io/rb/jekyll_time_since.svg)](https://badge.fury.io/rb/jekyll_time_since)

`jekyll_time_since` is a Jekyll plugin that provides new Liquid filters called
`years_since`, `months_since`, `days_since`, `hours_since`, `minutes_since` and `seconds_since`.
The plugin is packaged as a Ruby gem.


## Additional Information

More information is available on Mike Slinn's web site about
[Jekyll plugins](https://github.com/mslinn/jekyll_time_since).


## Installation

Add this line to your application's Gemfile:

```ruby
group :jekyll_plugins do
  gem 'jekyll_time_since'
end
```

And then execute:

```shell
$ bundle
```


## Usage

These tags all work in a similar manner; they accept one parameter,
which is either a date string (`YYYY-MM-dd`) or an
[ISO 8601-1:2019](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations) datetime string (`YYYY-MM-ddThh:mm`).
Just a year can be specified, which implies Jan 1 at midnight.

The date and time strings can be surrounded with quotes, double quotes, or not.
Time zone can be omitted, or specified as GMT, Z, or +/- HHMM.

```html
{{ "1959" | years_since  }} {{ '1959' | years_since }}
{{ "1959-02-03" | years_since }} {{ '1959-02-03' | years_since }}
{{ "1959-02-03T01:02" | years_since }} {{ '1959-02-03T01:02' | years_since }}
{{ "1959-02-03T01:02:00Z" | years_since }} {{ "1959-02-03T01:02:00-0400" | years_since }}

{{ "1959" | months_since }} {{ months_since '1959' }}
{{ "1959-02-03" months_since }} {{ '1959-02-03' | months_since }}
{{ "1959-02-03T01:02" | months_since }} {{ '1959-02-03T01:02' | months_since }}
{{ "1959-02-03T01:02:00Z" | months_since }} {{ "1959-02-03T01:02:00-0400" | months_since }}

{{ "1959" | weeks_since }} {{ '1959' | weeks_since }}
{{ "1959-02-03" | weeks_since }} {{ '1959-02-03' | weeks_since }}
{{ "1959-02-03T01:02" | weeks_since }} {{ '1959-02-03T01:02' | weeks_since }}
{{ "1959-02-03T01:02:00Z" | weeks_since }} {{ "1959-02-03T01:02:00-0400" | weeks_since }}

{{ "1959" | days_since }} {{ '1959' | days_since }}
{{ "1959-02-03" | days_since }} {{ '1959-02-03' | days_since }}
{{ "1959-02-03T01:02" | days_since }} {{ '1959-02-03T01:02' | days_since }}
{{ "1959-02-03T01:02:00Z" | days_since }} {{ "1959-02-03T01:02:00-0400" | days_since }}

{{ "1959" | hours_since}} {{ '1959' | hours_since }}
{{ "1959-02-03" | hours_since }} {{ '1959-02-03' | hours_since }}
{{ "1959-02-03T01:02" | hours_since }} {{ '1959-02-03T01:02' | hours_since }}
{{ "1959-02-03T01:02:00Z" | hours_since }} {{ "1959-02-03T01:02:00-0400" | hours_since }}

{{ "1959" | minutes_since }} {{ '1959' | minutes_since }}
{{ "1959-02-03" | minutes_since }} {{ '1959-02-03' | minutes_since }}
{{ "1959-02-03T01:02" | minutes_since }} {{ '1959-02-03T01:02' | minutes_since }}
{{ "1959-02-03T01:02:00Z" | minutes_since }} {{ "1959-02-03T01:02:00-0400" | minutes_since }}

{{ "1959" | seconds_since }} {{ '1959' | seconds_since }}
{{ "1959-02-03" | seconds_since }} {{ '1959-02-03' | seconds_since }}
{{ "1959-02-03T01:02" | seconds_since }} {{ '1959-02-03T01:02' | seconds_since }}
{{ seconds_since "1959-02-03T01:02:00" }} {{ seconds_since '1959-02-03T01:02:00' }}
```


## Development

After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.


### Build and Install Locally

To build and install this gem onto your local machine, run:

```shell
$ rake install
```

The following also does the same thing:

```shell
$ bundle exec rake install
jekyll_time_since 0.1.0 built to pkg/jekyll_time_since-0.1.0.gem.
jekyll_time_since (0.1.0) installed.
```

Examine the newly built gem:

```shell
$ gem info jekyll_time_since

*** LOCAL GEMS ***

jekyll_time_since (0.1.0)
    Author: Michael Slinn
    Homepage: https://github.com/mslinn/jekyll_time_since
    License: MIT
    Installed at: /home/mslinn/.gems

    A Jekyll plugin that provides new Liquid tags called years_since, months_since, days_since, hours_since, minutes_since and seconds_since.
```


### Build and Push to RubyGems

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

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
