require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/property.rb' )
also_reload( '../models/*' )


get '/properties' do
  @properties = Property.all()
  erb (:"properties/index")
end

get '/properties/new' do
  erb (:"properties/new")
end

get '/properties/:id' do
  @property = Property.find(params[:id])
  erb(:"properties/show")
end

get '/properties/:id/edit' do
  @property = Property.find(params[:id])
  erb(:"properties/edit")
end

post '/properties' do
  property = Property.new(params).save()
  redirect to("/properties")
end

post '/properties/:id' do
  Property.new(params).update()
  redirect to("/properties")
end

post '/properties/:id/delete' do
  @property = Property.find(params[:id])
  @property.update_status_archived()
  redirect to("/properties")
end
