require_relative('../db/sql_runner')

class Album

attr_reader :id, :title, :genre, :stock_level, :buy_price, :sell_price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @stock_level = options["stock_level"].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
  end

end
