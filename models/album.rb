require_relative('../db/sql_runner')

class Album

attr_reader :id, :title, :genre, :stock_level, :buy_price, :sell_price, :release, :artist

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @stock_level = options["stock_level"].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @release = options['release'].to_i
    @artist = options['artist'].to_i
  end

  def save
    sql = "INSERT INTO albums
    (title, genre, stock_level, buy_price, sell_price, release, artist)
      VALUES
      ($1, $2, $3, $4, $5, $6, $7)
      RETURNING * "
    values = [@title, @genre, @stock_level, @buy_price, @sell_price, @release, @artist]
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

  def delete()
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE albums
    SET
      (title, genre, stock_level, buy_price, sell_price, release, artist) =
      ($1, $2, $3, $4, $5, $6, $7)
      WHERE id = $8"
    values = [@title, @genre, @stock_level, @buy_price, @sell_price, @release, @artist, @id]
    SqlRunner.run( sql, values )
  end

  def total_value
    return @stock_level * @buy_price 

  end
end
