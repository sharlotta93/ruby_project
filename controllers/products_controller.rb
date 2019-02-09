require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/category' )
require_relative( '../models/product' )
require_relative( '../models/supplier' )
also_reload( '../models/*' )


get '/products' do
  @products = Product.all()
  @suppliers = Supplier.all()
  erb ( :"products/index" )
end

get '/products/new' do
  erb(:"products/new")
end

get '/products/:id/delete' do

end
