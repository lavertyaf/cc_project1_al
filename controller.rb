require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/album')
require('pry-byebug')

get '/' do
  erb(:index)
end

get '/inventory' do
  @albums = Album.all
  @total_value = Album.total_value
  @total_stock = Album.total_stock
  erb(:stock)
end

get '/albums/new' do
  # @albums = album.find(params['id'])
  @artist = Artist.find(params['artist_id'].to_i)
  erb(:new)
end

post '/artists' do
  Artist.new(params).save
  redirect to '/inventory'
end

get '/albums/:id' do
  @albums = Album.find(params['id'])
  @profit = @albums.profit
  erb(:show)
end

post '/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums/#{params['id']}"
end

get '/albums/:id/reorder' do
  @albums = Album.all
  @artist = Artist.find(params['id'])
  erb(:edit)
end

get '/reorder' do
  @artists = Album.artist
  erb(:reorder)
end

post '/reorder' do
  puts params
  Album.update_stock(params["album"].to_i, params["quantity"].to_i)
  erb(:increased_stock)
end

post '/albums/:id/delete' do
  album = Album.find(params['id'])
  album.delete
  redirect to '/music_shop'
end
