require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/property.rb' )
also_reload( '../models/*' )

get '/properties' do
  @properties = Property.all()
  erb ( :"properties/index" )
end
