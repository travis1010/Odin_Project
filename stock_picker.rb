def stock_picker(stock_prices)
    profits = Hash.new(0)
    stock_prices.each_with_index do |buy_price, buy_index|
        stock_prices[buy_index + 1..-1].each_with_index do |sell_price, sell_index|
            profit = sell_price - buy_price
            days = [buy_index, sell_index + buy_index + 1]
            profits[days] = profit
        end
    end
    profits.key(profits.values.max)
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# [1,4]  # for a profit of $15 - $3 == $12