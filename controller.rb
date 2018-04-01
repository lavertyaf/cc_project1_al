require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/album')
require('pry-byebug')

get '/music_shop' do
  erb(:index)
end

get '/music_shop/inventory' do
  @albums = Album.all
  # @total_value = @albums.total_value
  erb(:stock)
end

get '/music_shop/new' do
  @albums = Album.all
  erb(:new)
end

post '/music_shop' do
  Artist.new(params).save
  redirect to '/music_shop/inventory'
end

get '/music_shop/:id' do
  @albums = Album.find(params['id'])
  @profit = @albums.profit
  erb(:show)
end

post '/music_shop/:id' do
  album = Album.new(params)
  album.update
  redirect to "/music_shop/#{params['id']}"
end

get '/music_shop/:id/order' do
  @albums = Album.all
  @artist = Artist.find(params['id'])
  erb(:edit)
end



post '/music_shop/:id/delete' do
  album = Album.find(params['id'])
  album.delete
  redirect to '/music_shop'
end
