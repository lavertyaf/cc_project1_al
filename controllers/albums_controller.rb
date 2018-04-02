require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/album')
require('pry-byebug')

get '/albums/new' do
  @artists = Artist.find(params['artist_id'].to_i)
  erb(:reorder_form)
end

get '/albums/:id' do
  @album = Album.find(params['id'])
  @profit = @album.profit
  erb(:show)
end

post '/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums/#{params['id']}"
end

get '/albums/:id/reorder' do
  @albums = Album.all
  @artist_id = Artist.find(params['id'].to_i)
  erb(:edit)
end

post '/albums/:id/delete' do
  album = Album.find(params['id'])
  album.delete
  # redirect to '/music_shop'
end
