require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/album')
require('pry-byebug')

get '/' do
  erb(:index)
end

get '/inventory' do
  @albums = Album.all
  @total_value = Album.total_value
  @total_stock = Album.total_stock
  # @artist_name = Album.artist_name
  erb(:stock)
end

get '/reorder' do
  @artists = Artist.all
  erb(:reorder)
end

post '/reorder' do
  puts params
  Album.update_stock(params["album"].to_i, params["quantity"].to_i)
  erb(:increased_stock)
end
