require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'music_shop', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

  # def self.run( sql, values = [] )
  #   begin
  #     db = PG.connect({ dbname: 'd1k3gg6j3rglnf', host: 'ec2-107-21-255-2.compute-1.amazonaws.com', port: '5432', user: 'rbfjccjgzdzpbm', password: '40dcb1946c1b7d256a35a2d8527e199ef266a9d60185f345c775df911a87eddd' })
  #     db.prepare("query", sql)
  #     result = db.exec_prepared( "query", values )
  #   ensure
  #     db.close() if db != nil
  #   end
  #   return result
  # end

end
