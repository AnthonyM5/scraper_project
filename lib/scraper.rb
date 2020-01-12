require_relative '../lib/environment.rb'

class Scraper

  def self.scrape_index_page(index_url)
    crypto_array = []
    market = Nokogiri::HTML(open(index_url))
    market.css("div.cmc-table__table-wrapper-outer tr.cmc-table-row").collect{
      |coins|
      coin_info = {
        name: coins.css(".cmc-link").first.text,
        price: coins.css(".cmc-link")[1].text,
        volume: coins.css(".cmc-link")[2].text,
        market_cap: coins.css("div")[2].text,
        circulating_supply: coins.css("div")[3].text,
        change_24: coins.css("div")[4].text
      }
      crypto_array << coin_info
    }
    crypto_array
  end

end
