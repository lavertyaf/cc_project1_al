require('sinatra')
require('sinatra/contrib/all') 
require_relative('../models/artist')
require_relative('../models/album')
# require('pry-byebug')

get '/albums' do
  @albums = Album.all
  @total_value = Album.total_value
  @total_stock = Album.total_stock
  erb(:"albums/index")
end

get '/albums/reorder' do
  @artist = Artist.find(params['artist_id'].to_i)
  @albums = @artist.albums()
  erb(:reorder_form)
end

get '/albums/new' do
  @artists = Artist.all
  erb(:"albums/new")
end

post '/albums' do
  album = Album.new(params)
  album.save
  redirect to "/albums"
end

post '/albums/:id/delete' do
  album = Album.find(params['id'].to_i)
  album.delete()
  redirect to ("/albums")
end

get '/albums/:id/update' do
  @album = Album.find(params['id'].to_i)
  erb(:"albums/update")
end

post '/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums"
end

get '/albums/:id' do
  @album = Album.find(params['id'].to_i)
  @profit = @album.profit
  erb(:"albums/show")
end
