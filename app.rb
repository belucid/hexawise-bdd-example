require 'sinatra'
require 'yaml'

EXCHANGE_RATES = YAML.load_file('./data/exchange-rates.yml')

get '/exchange-rate/:from/:from_amount/:to' do |from, from_amount, to|

  if from == from.downcase then # hmm, here be dragons?
    from = from.upcase
    to = to.upcase
  end

  if EXCHANGE_RATES[from] == nil then # hmm, and here be dragons too?
    status 400
  else
    rate = EXCHANGE_RATES[from][to]
    result_amount = Integer(from_amount) * rate
    puts "Exchange #{from_amount} #{from} for #{result_amount} #{to}"
    result_amount.to_s
  end

end

not_found do
  status 404
end