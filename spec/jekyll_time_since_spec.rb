require 'date'
require_relative '../lib/jekyll_time_since'

RSpec.describe(TimeSince) do
  include TimeSince

  def py_time(unit, date)
    `python3 bin/time_since.py #{unit} #{date}`.strip.to_i
  end

  it 'computes time since' do
    expect(py_time('year', '1956-01-01')).to eq(years_since('1956'))
    expect(py_time('year', '1956-10-15')).to eq(years_since('1956-10-15'))

    expect(py_time('month', '1956-01-01')).to eq(months_since('1956'))
    expect(py_time('month', '1956-10-15')).to eq(months_since('1956-10-15'))

    _x = py_time('week', '1956-01-01')
    _y = weeks_since('1956')

    expect(py_time('week', '1956-01-01')).to eq(weeks_since('1956'))
    expect(py_time('week', '1956-10-15')).to eq(weeks_since('1956-10-15'))
  end
end
