class Coins
  attr_accessor :name, :price, :volume, :market_cap, :circulating_supply, :change_24
  @@all = []

  def initialize(crypto_hash)
    crypto_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(coins_array)
    coins_array.each{|crypto_hash|
      self.new(crypto_hash)
      }
  end

  def self.all
    @@all
  end

end
