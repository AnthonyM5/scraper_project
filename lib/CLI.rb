require_relative '../lib/environment.rb'

class CLI
INDEX_URL = "https://coinmarketcap.com/"

  def call
    make_coins
    input = ""
    while input != 'quit'
      puts "Welcome to the Cryptocurrency Market"
      puts "To list Top 100 Currencies, type 'start'"
      puts "To quit, type 'quit'"
      input = gets.chomp

      case input
      when 'start'
        display_coins
        show_coin
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

  def show_coin
    puts "Which currency would you like to know more about?"
    coins = Coins.all
    input = gets.chomp.to_i
    time = Time.now

    if (1..coins.length).include?(input)
      coin = Coins.all[input - 1]
    puts "As of #{time + Time.zone_offset('EST')}:"
    puts "#{coin.name}'s Current Price is: #{coin.price} USD."
    puts "#{coin.name}'s Change Over 24 Hours is: #{coin.change_24}."
    puts "#{coin.name}'s 24 Hour Volume is: #{coin.volume} USD."
    puts "#{coin.name}'s Current Market Captialization is: #{coin.market_cap} USD."
    puts "#{coin.name}'s Total Circulating Supply is: #{coin.circulating_supply}."
    if coin.circulating_supply.split.include?("*")
      puts "#{coin.name} is not mineable."
    else
      puts "#{coin.name} is mineable."
    end
    end
  end

end
