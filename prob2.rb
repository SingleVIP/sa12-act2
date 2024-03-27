require 'httparty'
require 'json'

def fetch_and_track_cryptocurrencies
  url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
  response = HTTParty.get(url)
  cryptocurrencies = JSON.parse(response.body)

  top_5_cryptos = cryptocurrencies.sort_by { |crypto| crypto['market_cap'] }.reverse.first(5)

  puts "Top 5 Cryptocurrencies by Market Capitalization:"
  top_5_cryptos.each do |crypto|
    puts "Name: #{crypto['name']}"
    puts "Price: #{crypto['current_price']} USD"
    puts "Market Cap: #{crypto['market_cap']} USD"
    puts "---------------------------------"
  end
end

fetch_and_track_cryptocurrencies
