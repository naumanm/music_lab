require 'sinatra'
require 'sinatra/activerecord'
require './models/artist'
require 'pry'

# root route
get '/' do 
  redirect '/artists'
end

# - GET

# /artists - reads all artists
get '/artists' do
  @artists = Artist.all
  erb :index
end

# /artists/new - display a form to create a new artist
get '/artists/new' do
  erb :new  
end

# /artist/:id - reads a single artist
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :show
end

# `/artists/:id/edit` - display a form to edit an artist
get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :edit
end

# - POST

# `/artists` - create a new artist in the database
post '/artists' do
  Artist.create({:name => params[:artist_name]})
  redirect '/artists'
end


# - PUT

# `/artists/:id` - update the artist with the given id.
put '/artists/:id' do
  artist = Artist.find(params[:id])
  artist.name = params[:artist_name]
  artist.save
  redirect '/artists'
end


# - DELETE
# `/artists/:id` - remove an artist from the database.  
delete '/artists/:id' do
  artist = Artist.find(params[:id])
  artist.destroy
  redirect '/artists'
end




