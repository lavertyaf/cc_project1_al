require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/album')
require('pry-byebug')

post '/artists' do
  Artist.new(params).save
  redirect to '/inventory'
end
