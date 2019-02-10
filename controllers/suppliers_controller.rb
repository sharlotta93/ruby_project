require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/category' )
require_relative( '../models/product' )
require_relative( '../models/supplier' )
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all()
  erb(:"suppliers/index")
end

get '/suppliers/new' do
  erb( :"suppliers/new" )
end

post '/suppliers' do
  supplier = Supplier.new(params)
  supplier.save()
  redirect to "/suppliers"
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params['id'].to_i)
  erb( :"suppliers/edit")
end

post '/suppliers/:id' do
  supplier = Supplier.new(params)
  supplier.update()
  redirect to "/suppliers"
end

post '/suppliers/:id/delete' do
  Supplier.delete(params[:id])
  redirect to("/suppliers")
end
