require_relative '../lib/scraper'
require_relative '../lib/coins'
require 'nokogiri'
require 'open-uri'

class CLI
INDEX_URL = "https://coinmarketcap.com/"

  def call
    make_coins
    input = ""
    while input != 'quit'
      puts "Welcome to the Cryptocurrency Market"
      puts "To list Top 100 Currencies, enter 'list coins'"
      puts "To quit, type 'quit'"
      input = gets.chomp

      case input
      when 'list coins'
        display_coins
      end
    end
  end

  def make_coins
    coins_array = Scraper.scrape_index_page(INDEX_URL)
    Coins.create_from_collection(coins_array)
  end

  def display_coins
    Coins.all.each_with_index{|coin, index|
      puts "#{index + 1}. #{coin.name}"
    }
  end

end
