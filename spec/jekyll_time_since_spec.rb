# frozen_string_literal: true

require_relative "../lib/jekyll_time_since"

RSpec.describe(TimeSince) do
  include TimeSince
  it "Computes years" do
    years_since("1956")
    years_since("1956-10-15")

    months_since("1956")
    months_since("1956-10-15")

    weeks_since("1956")
    weeks_since("1956-10-15")
  end
end
