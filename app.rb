require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/properties_controller')
# require_relative('controllers/tenants_controller')
# require_relative('controllers/rentals_controller')

get '/' do
  erb( :index )
end
