# class AutoBalancer
#   constructor()

#   end

# end

def auto_rebalance(initialCash = 1000, initialBtcPrice = 1000, initialBtc = 1)
  cash = initialCash
  btc = initialBtc
  btcPrice = initialBtcPrice
  btcValue = btc * btcPrice

  for i in 0...5
    btc = updateBtc(100, cash, btc, btcPrice, btcValue)
    cash = updateCash(100, cash, btc, btcPrice, btcValue)
  end
  cash
end

def updateBtc(priceChange, cash, btc, btcPrice, btcValue)
  btcPrice += priceChange
  btcValue = btc * btcPrice
  cash = (cash + btcValue) / 2
  btc = cash.to_f / btcPrice.to_f
end

def updateCash(priceChange, cash, btc, btcPrice, btcValue)
  btcPrice += priceChange
  btcValue = btc * btcPrice
  cash = (cash + btcValue) / 2
end




puts auto_rebalance()