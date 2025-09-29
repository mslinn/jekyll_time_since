require 'jekyll_plugin_logger'
require 'time'
require_relative 'jekyll_time_since/version'

module JekyllTimeSinceName
  PLUGIN_NAME = 'jekyll_time_since'.freeze
end

# These tags all work in a similar manner; they accept one parameter,
# which is either a date string (`YYYY-MM-dd`) or an
# [ISO 8601-1:2019](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations) datetime string (`YYYY-MM-ddThh:mm`).
#
# Just a year can be specified, which implies Jan 1 at midnight.
# You can specify a time zone
module Jekyll
  # For more information, see https://ruby-doc.org/stdlib-2.7.2/libdoc/time/rdoc/Time.html
  module TimeSince
    @logger = PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)

    # Filters a string containing a year, date or ISO_8601 datetime.
    # @return [integer] the number of years since the input.
    def years_since(string)
      now = DateTime.now
      string += '-01-01' unless string.include?('-')
      date = Time.parse(string)
      years = now.year - date.year
      years -= 1 if date.month > now.month || (date.month >= now.month && date.day > now.day)
      years
    end

    def months_since(date_str)
      date_str += '-01-01' unless date_str.include?('-')
      date = Date.parse(date_str)
      now = Date.today
      months = ((now.year - date.year) * 12) + (now.month - date.month)
      months -= 1 if now.day < date.day
      months
    end

    def weeks_since(string)
      result = days_since(string)
      result.to_i / 7
    end

    def days_since(string)
      string += '-01-01' unless string.include?('-')
      date1 = Date.parse(string)

      date2 = Time.new.to_date
      (date2 - date1).to_i
    end

    def hours_since(string)
      minutes_since(string) / 60
    end

    def minutes_since(string)
      seconds_since(string) / 60
    end

    def seconds_since(string)
      string += '-01-01' unless string.include?('-')
      (Time.new - Time.parse(string)).to_i
    end
  end
end

PluginMetaLogger.instance.info { "Loaded #{JekyllTimeSinceName::PLUGIN_NAME} v#{JekyllTimeSinceVersion::VERSION} plugin." }
Liquid::Template.register_filter(Jekyll::TimeSince)
