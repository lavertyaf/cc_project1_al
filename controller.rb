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
  @albums = Album.all
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

get '/albums/:id/order' do
  @albums = Album.all
  @artist = Artist.find(params['id'])
  erb(:edit)
end

get '/order' do
  @artists = Album.artist
  erb(:order)
end

post '/order' do

  redirect to "/albums/inventory"
end

post '/albums/:id/delete' do
  album = Album.find(params['id'])
  album.delete
  redirect to '/music_shop'
end
