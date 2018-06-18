require('sinatra')
require('sinatra/contrib/all') 
require_relative('../models/artist')
require_relative('../models/album')
# require('pry-byebug')

get '/artists' do
  @artists = Artist.all
  erb(:"artists/index")
end

get '/artists/new' do
  erb(:"artists/new")
end

post '/artists' do
  Artist.new(params).save
  redirect to '/albums/new'
end
