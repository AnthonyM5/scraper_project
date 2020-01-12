require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper

  def initialize
    crypto = []
    market = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    market.css("div.cmc-table__table-wrapper-outer .tr.cmc-table-row").collect{
      |coins|
      coin_info = {
        name: coins.css(".cmc-link").first.text,
        price: coins.css(".cmc-link")[1].text
      }
      crypto << coin_info
    }
  end

end
