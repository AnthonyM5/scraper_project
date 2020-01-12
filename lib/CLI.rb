require_relative '../lib/scraper'
require_relative '../lib/coins'
require 'nokogiri'
require 'open-uri'

class CLI
INDEX_URL = "https://coinmarketcap.com/"

  def call
    make_coins
    display_coins
  end

  def make_coins
    coins_array = Scraper.scrape_index_page(INDEX_URL)
    Coins.create_from_collection(coins_array)
  end

  def display_coins
    Coins.all.each{|coin|
      puts "#{coin.name}"
      puts "Current price is: #{coin.price}"
    }
  end

end
