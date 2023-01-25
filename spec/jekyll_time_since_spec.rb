require 'date'
require_relative '../lib/jekyll_time_since'

RSpec.describe(TimeSince) do
  include TimeSince
  it 'computes time since' do
    diff1 = (Date.today - Date.new(1956, 10, 15)).to_i
    diff2 = (Date.today - Date.new(1956, 1, 1)).to_i

    expect(diff1 / 365).to eq(years_since('1956').to_i)
    expect(diff2).to eq(years_since('1956-10-15').to_i)

    expect(months_since('1956')).to eq('723')
    expect(months_since('1956-10-15')).to eq('723')

    expect(weeks_since('1956')).to eq('723')
    expect(weeks_since('1956-10-15')).to eq('723')
  end
end
