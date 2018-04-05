require_relative('../db/sql_runner')

class Album

attr_reader :id, :title, :genre, :stock_level, :buy_price, :sell_price, :release, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @stock_level = options["stock_level"].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @release = options['release'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums
    (title, genre, stock_level, buy_price, sell_price, release, artist_id)
      VALUES
      ($1, $2, $3, $4, $5, $6, $7)
      RETURNING * "
    values = [@title, @genre, @stock_level, @buy_price, @sell_price, @release, @artist_id]
    album_data = SqlRunner.run(sql, values)
    @id = album_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run( sql )
    result = albums.map { |album| Album.new( album ) }
  return result
  end

  def self.find( id )
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    album = SqlRunner.run( sql, values )
    result = Album.new ( album.first )
    return result
  end

  def self.find_and_delete( id )
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]
    albums = SqlRunner.run( sql, values )
    result = Album.delete
    return result
  end

  def artist_name
      sql = "SELECT * FROM artists WHERE artists.id = $1"
      values = [@artist_id]
      result = SqlRunner.run( sql, values )
      artist =  Artist.new( result.first )
      return artist.name
  end

  def delete()
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE albums
    SET
      (title, genre, stock_level, buy_price, sell_price, release, artist_id) =
      ($1, $2, $3, $4, $5, $6, $7)
      WHERE id = $8"
    values = [@title, @genre, @stock_level, @buy_price, @sell_price, @release, @artist_id, @id]
    SqlRunner.run( sql, values )
  end

  def self.update_stock(id, quantity)
    sql = "UPDATE albums
    SET
    stock_level = stock_level + $1
    WHERE id = $2"
    values = [quantity, id]
    SqlRunner.run( sql, values )
  end

  def self.total_value
    sql = "SELECT SUM(buy_price * stock_level) AS total_value FROM albums"
    values = []
    result = SqlRunner.run( sql, values )
    return result.first["total_value"]
  end

  def self.total_stock
    sql = "SELECT SUM(stock_level) AS total_stock FROM albums"
    values = []
    result = SqlRunner.run( sql, values )
    return result.first["total_stock"]
  end

  def profit
    @sell_price - @buy_price
  end

  def stock_level_advice()
    if @stock_level <= 5
      return "Stock level is low, maybe order some stock"
    elsif @stock_level > 6  && @stock_level < 16
      return "Stock level is ok, keep an eye on this"
    elsif @stock_level >= 16
      return "You have loads of stock! Maybe put it on special offer?"
    end
  end

end
