require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/album')
require('pry-byebug')

get '/music_shop' do
  @albums = Album.all
  erb(:index)
end

get '/music_shop/new' do
  @artists = Artist.all
  erb(:new)
end
#
post '/music_shop' do
  Artist.new(params).save
  redirect to '/music_shop'
end

get '/music_shop/:id' do
  @artist = Artist.find(params['id'])
  erb(:show)
end

get '/music_shop/:id/edit' do
  @albums = Album.all
  @artist = Artist.find(params['id'])
  erb(:edit)
end
#
post '/music_shop/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to "/music_shop/#{params['id']}"
end

post '/music_shop/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete
  redirect to '/music_shop'
end
