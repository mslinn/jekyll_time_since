# frozen_string_literal: true

require "jekyll_plugin_logger"
require "time"
require_relative "jekyll_time_since/version"

module JekyllTimeSinceName
  PLUGIN_NAME = "jekyll_time_since"
end

# These tags all work in a similar manner; they accept one parameter,
# which is either a date string (`YYYY-MM-dd`) or an
# [ISO 8601-1:2019](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations) datetime string (`YYYY-MM-ddThh:mm`).
# Just a year can be specified, which implies Jan 1 at midnight.
# You can specify a time zone
# For more information, see https://ruby-doc.org/stdlib-2.7.2/libdoc/time/rdoc/Time.html
#
# The date and time strings can be surrounded with quotes, double quotes, or not.
# The following examples compute elapsed time since "the day the music died" (1959-02-03).
# See https://en.wikipedia.org/wiki/The_Day_the_Music_Died
#
# @example years_since
#   Computes years since the date specified
#   {% "1959" | years_since  %} {% '1959' | years_since %}
#   {% "1959-02-03" | years_since %} {% '1959-02-03' | years_since %}
#   {% "1959-02-03T01:02:00" | years_since %} {% '1959-02-03T01:02:00' | years_since %}
#   {% "1959-02-03T01:02:00Z" | years_since %} {% "1959-02-03T01:02:00-0400" | years_since %}
#
# @example months_since
#   Computes months since the date specified
#   {% "1959" | months_since %} {% months_since '1959' %}
#   {% "1959-02-03" months_since %} {% '1959-02-03' | months_since %}
#   {% "1959-02-03T01:02" | months_since %} {% '1959-02-03T01:02' | months_since %}
#   {% "1959-02-03T01:02:00Z" | months_since %} {% "1959-02-03T01:02:00-0400" | months_since %}
#
# @example weeks_since
#   Computes weeks since the date specified
#   {% "1959" | weeks_since %} {% '1959' | weeks_since %}
#   {% "1959-02-03" | weeks_since %} {% '1959-02-03' | weeks_since %}
#   {% "1959-02-03T01:02:00" | weeks_since %} {% '1959-02-03T01:02:00' | weeks_since %}
#   {% "1959-02-03T01:02:00Z" | weeks_since %} {% "1959-02-03T01:02:00-0400" | weeks_since %}
#
# @example days_since
#   Computes days since the date specified
#   {% "1959" | days_since %} {% '1959' | days_since %}
#   {% "1959-02-03" | days_since %} {% '1959-02-03' | days_since %}
#   {% "1959-02-03T01:02" | days_since %} {% '1959-02-03T01:02' | days_since %}
#   {% "1959-02-03T01:02:00Z" | days_since %} {% "1959-02-03T01:02:00-0400" | days_since %}
#
# @example hours_since
#   Computes hours since the date and time specified
#   {% "1959" | hours_since%} {% '1959' | hours_since %}
#   {% "1959-02-03" | hours_since %} {% '1959-02-03' | hours_since %}
#   {% "1959-02-03T01:02" | hours_since %} {% '1959-02-03T01:02' | hours_since %}
#   {% "1959-02-03T01:02:00Z" | hours_since %} {% "1959-02-03T01:02:00-0400" | hours_since %}
#
# @example minutes_since
#   Computes minutes since the date and time specified
#   {% "1959" | minutes_since %} {% '1959' | minutes_since %}
#   {% "1959-02-03" | minutes_since %} {% '1959-02-03' | minutes_since %}
#   {% "1959-02-03T01:02" | minutes_since %} {% '1959-02-03T01:02' | minutes_since %}
#   {% "1959-02-03T01:02:00Z" | minutes_since %} {% "1959-02-03T01:02:00-0400" | minutes_since %}
#
# @example seconds_since
#   Computes seconds since the date and time specified
#   {% "1959" | seconds_since %} {% '1959' | seconds_since %}
#   {% "1959-02-03" | seconds_since %} {% '1959-02-03' | seconds_since %}
#   {% "1959-02-03T01:02" | seconds_since %} {% '1959-02-03T01:02' | seconds_since %}
#   {% seconds_since "1959-02-03T01:02:00" %} {% seconds_since '1959-02-03T01:02:00' %}

module TimeSince
  @logger = PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)

  # Filters a string containing a year, date or ISO_8601 datetime.
  # @return [integer] the number of years since the input.
  def years_since(string)
    now = DateTime.now
    string += "-01-01" unless string.include?("-")
    date = Time.parse(string)
    years = now.year - date.year
    years -= 1 if date.month > now.month || (date.month >= now.month && date.day > now.day)
    years
  end

  def months_since(string)
    string += "-01-01" unless string.include?("-")
    date1 = Date.parse(string)

    date2 = Time.new.to_date
    ((date2 - date1).to_f / 365 * 12).round
  end

  def weeks_since(string)
    days_since(string) / 7
  end

  def days_since(string)
    hours_since(string) / 24
  end

  def hours_since(string)
    minutes_since(string) / 60
  end

  def minutes_since(string)
    seconds_since(string) / 60
  end

  def seconds_since(string)
    string += "-01-01" unless string.include?("-")
    (Time.new - Time.parse(string)).to_i
  end
end

PluginMetaLogger.instance.info { "Loaded #{JekyllTimeSinceName::PLUGIN_NAME} v#{JekyllTimeSinceVersion::VERSION} plugin." }
Liquid::Template.register_tag(JekyllTimeSinceName::PLUGIN_NAME, TimeSince)
