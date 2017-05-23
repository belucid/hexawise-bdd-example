require 'http'
require 'facets/string/titlecase'

def request_exchange
  response = HTTP.get("http://localhost:4567/exchange-rate/#{@from}/#{@amount}/#{@to}")
  @status = response.status
  response.body.readpartial
end

Given(/^an exchange from (\w+) to (\w+)$/) do |from, to|
  @from = from
  @to = to
end

Given(/^an exchange from (\w+) in (\w+) to (\w+) in (\w+)$/) do |from, from_case, to, to_case|

  case from_case
  when "upper"
    @from = from.upcase
  when "lower"
    @from = from.downcase
  when "mixed"
    @from = from.titlecase
  else
    assert false
  end

  case to_case
  when "upper"
    @to = to.upcase
  when "lower"
    @to = to.downcase
  when "mixed"
    @to = to.titlecase
  else
    assert false
  end

end

When(/^I exchange (\d+)$/) do |amount|
  @amount = amount
end

When(/^I exchange \-(\d+)$/) do |amount|
  @amount = amount
end

When(/^I exchange (\d+)\.(\d+)$/) do |whole, partial|
  @amount = "#{whole}.#{partial}"
end

Then(/^I get less$/) do
  assert request_exchange.to_f < @amount.to_f
end

Then(/^I get more$/) do
  assert request_exchange.to_f > @amount.to_f
end

Then(/^I get none$/) do
  assert request_exchange.to_f == 0.0
end

Then(/^I get an invalid request$/) do
  request_exchange
  assert @status == 400
end