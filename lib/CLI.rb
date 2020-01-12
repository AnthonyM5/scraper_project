require_relative '../lib/scraper.rb'
require_relative '../lib/coins.rb'
require 'nokogiri'
require 'open-uri'
class CLI

  def run
    make_coins
    display_coins
  end

  def make_coins
    crypto_array = Scraper.scrape_index_page
    Coins.create_from_collection(crypto_array)
    puts "coins made"
  end

  def display_coins
    Coins.all.each do |coin|
      puts "#{coin.name}"
      puts "#{coin.price}"
      puts "#{coin.market_cap}"

    end
  end

end
