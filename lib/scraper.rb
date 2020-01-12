require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper

  def self.scrape_index_page
    crypto_array = []
    market = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    market.css("div.cmc-table__table-wrapper-outer .tr.cmc-table-row").collect{
      |coins|
      coin_info = {
        name: coins.css(".cmc-link").first.text,
        price: coins.css(".cmc-link")[1].text
      }
      crypto_array << coin_info
    }
    crypto_array
  end

end
