require('sinatra')
require('sinatra/contrib/all') if development? 
require_relative('../models/artist')
require_relative('../models/album')
# require('pry-byebug')

get '/' do
  erb(:index)
end

post '/reorder' do
  Album.update_stock(params["id"].to_i, params["quantity"].to_i)
  erb(:increased_stock)
end
