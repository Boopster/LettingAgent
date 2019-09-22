require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/rental.rb' )
require_relative( '../models/property.rb' )
require_relative( '../models/tenant.rb' )
also_reload( '../models/*' )

get '/rentals' do
  @rentals = Rental.all
  erb(:"rentals/index")
end

get '/rentals/new' do
  @properties = Property.all
  @tenants = Tenant.all
  erb(:"rentals/new")
end

post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  redirect to("/rentals")
end

post '/rentals/:id/delete' do
  Rental.delete(params[:id])
  redirect to("/rentals")
end
