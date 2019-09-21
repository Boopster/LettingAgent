require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/property.rb' )
also_reload( '../models/*' )


get '/properties' do
  @properties = Property.all()
  erb ( :"properties/index" )
end

get '/properties/new' do
  erb ( :"properties/new" )
end

post '/properties' do
  property = Property.new(params)
  property.save()
  redirect to("/properties")
end
