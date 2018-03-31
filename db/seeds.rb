require_relative('../models/artist')
require_relative('../models/album')

artist1 = Artist.new({"name" => "Foo Fighters"})
artist2 = Artist.new({"name" => "Nirvana"})
artist3 = Artist.new({"name" => "Pink Floyd"})
artist4 = Artist.new({"name" => "Biffy Clyro"})
artist5 = Artist.new({"name" => "The Beatles"})
artist6 = Artist.new({"name" => "The Batfinks"})

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()
artist6.save()

album1 = Album.new({ "title" => "The Colour & the Shape", "genre" => "rock", "stock_level" => 10, "buy_price" => 10, "sell_price" => 17, "release" => 1997, "artist" => artist1.id})

album2 = Album.new({ "title" => "Foo Fighters", "genre" => "rock", "stock_level" => 15, "buy_price" => 9, "sell_price" => 17, "release" => 1995, "artist" => artist1.id})

album3 = Album.new({ "title" => "Nevermind", "genre" => "rock", "stock_level" => 3, "buy_price" => 5, "sell_price" => 20, "release" => 1991, "artist" => artist2.id})

album4 = Album.new({ "title" => "The Division Bell", "genre" => "psychedelic", "stock_level" => 16, "buy_price" => 8, "sell_price" => 17, "release" => 1994, "artist" => artist3.id})

album5 = Album.new({ "title" => "Darkside of the Moon", "genre" => "psychedelic", "stock_level" => 7, "buy_price" => 9, "sell_price" => 18, "release" => 1973, "artist" => artist3.id})

album6 = Album.new({ "title" => "The Wall", "genre" => "psychedelic", "stock_level" => 14, "buy_price" => 7, "sell_price" => 20, "release" => 1979, "artist" => artist3.id})

album7 = Album.new({ "title" => "Ellipsis", "genre" => "rock", "stock_level" => 4, "buy_price" => 7, "sell_price" => 16, "release" => 2016, "artist" => artist4.id})

album8 = Album.new({ "title" => "Only Revolutions", "genre" => "rock", "stock_level" => 5, "buy_price" => 8, "sell_price" => 20, "release" => 2009, "artist" => artist4.id})

album9 = Album.new({ "title" => "Infinity Land", "genre" => "rock", "stock_level" => 7, "buy_price" => 10, "sell_price" => 21, "release" => 2004, "artist" => artist4.id})

album10 = Album.new({ "title" => "Opposites", "genre" => "rock", "stock_level" => 8, "buy_price" => 8, "sell_price" => 16, "release" => 2013, "artist" => artist4.id})

album11 = Album.new({ "title" => "One", "genre" => "pop", "stock_level" => 17, "buy_price" => 4, "sell_price" => 21, "release" => 2000, "artist" => artist5.id})

album12 = Album.new({ "title" => "Help!", "genre" => "pop", "stock_level" => 5, "buy_price" => 6, "sell_price" => 15, "release" => 1965, "artist" => artist5.id})

album13 = Album.new({ "title" => "Abbey Road", "genre" => "pop", "stock_level" => 20, "buy_price" => 15, "sell_price" => 21, "release" => 1969, "artist" => artist5.id})

album14 = Album.new({ "title" => "Rock n Roll Frog", "genre" => "rock & roll", "stock_level" => 7, "buy_price" => 15, "sell_price" => 27, "release" => 1988, "artist" => artist6.id})

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()
album8.save()
album9.save()
album10.save()
album11save()
album12.save()
album13.save()
album14.save()
