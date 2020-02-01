require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require( 'date' )
require_relative( '../models/rental.rb' )
require_relative( '../models/property.rb' )
require_relative( '../models/tenant.rb' )
also_reload( '../models/*' )

get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

get '/rentals/new' do
  @properties = Property.all()
  @tenants = Tenant.all()
  erb(:"rentals/new")
end

get '/rentals/:id' do
  @rental = Rental.find(params[:id])
  @tenants = Tenant.all()
  erb(:"rentals/addtenant")
end

post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  rental.property.update_status_leased
  rental.tenant.update_status_active()
  redirect to("/rentals")
end

post '/rentals/:id' do
  @rental = Rental.find(params[:id])
  @rental.update()
  redirect to("/rentals")
end

post '/rentals/:id/delete' do
  @rental = Rental.find(params[:id])
  @rental.delete()
  @rental.property.update_status_listed()
  @rental.tenant.update_status_inactive()
  redirect to("/rentals")
end
