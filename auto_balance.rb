class AutoBalancer

  attr_accessor :cash, :btc, :btcPrice, :btcValue

  def initialize(initialCash = 1000, initialBtcPrice = 1000, initialBtc = 1)
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
    {
      "cash" => @cash,
      "btc" => @btc,
      "btcPrice" => @btcPrice,
      "btcValue" => @btcValue,
      "total" => @total
    }
  end

end

balancer = AutoBalancer.new

