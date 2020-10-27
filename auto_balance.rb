class AutoBalancer

  attr_accessor :cash, :btc, :btcPrice, :btcValue

  def initialize(initialCash = 1000, initialBtcPrice = 1000, initialBtc = 1)
    @initialBtc = initialBtc
    @initialCash = initialCash
    @cash = initialCash
    @btc = initialBtc
    @btcPrice = initialBtcPrice
    @btcValue = btc * btcPrice
    @total = btcValue + cash
  end

  def updateBtcPrice(priceChange)
    raise 'Price cannot be negative' if @btcPrice + priceChange <= 0
    @btcPrice += priceChange
    btcValue = btc * btcPrice
    @cash = (cash + btcValue) / 2
    @btc = cash.to_f / btcPrice.to_f
    @btcValue = @btc * @btcPrice
    @total = @btcValue + @cash
    returnResults()
  end

  def returnResults
    {
      "cash" => @cash,
      "btc" => @btc,
      "btcPrice" => @btcPrice,
      "btcValue" => @btcValue,
      "total" => @total,
      "won" => haveWon()
    }
  end

  def haveWon()
    totalHolding = @initialCash + (@initialBtc * @btcPrice)
    if @total == totalHolding
      return 'draw'
    end
    @total > totalHolding
  end

end

balancer = AutoBalancer.new
updateValue = 100
updateValueTwo = 94.85227


# for a in 0...1000
#   balancer.updateBtcPrice(updateValue)
#   balancer.updateBtcPrice(-updateValueTwo)
# end

# iterate update value two between 90 and 100
# return when it wins
for i in 945000...1000000
  # puts i
  puts 100 - (i.to_f/10000)
  for a in 0...1000
    balancer.updateBtcPrice(updateValue)
    balancer.updateBtcPrice(-(i.to_f/10000))
  end
  if balancer.haveWon() == true
    puts 'won'
    return
  end
  balancer = AutoBalancer.new
end

puts balancer.returnResults()