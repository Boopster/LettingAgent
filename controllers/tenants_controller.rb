require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tenant.rb' )
also_reload( '../models/*' )
require( 'pry-byebug' )

get '/tenants' do
  @tenants = Tenant.all()
  erb (:"tenants/index")
end

get '/tenants/new' do
  erb (:"tenants/new")
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb(:"tenants/show")
end

get '/tenants/:id/edit' do
  @tenant = Tenant.find(params[:id])
  erb(:"tenants/edit")
end

post '/tenants' do
  tenant = Tenant.new(params)
  tenant.save()
  redirect to("/tenants")
end

post '/tenants/:id' do
  Tenant.new(params).update()
  redirect to("/tenants")
end

post '/tenants/:id/delete' do
  @tenant = Tenant.find(params[:id])
  @tenant.delete()
  redirect to("/tenants")
end
#
# binding.pry
# nil
