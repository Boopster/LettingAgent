require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/properties_controller')
require_relative('controllers/tenants_controller')
require_relative('controllers/rentals_controller')
also_reload('./models/*')

get '/' do
  @properties = Property.all()
  erb(:"properties/index")
end
