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
  @suppliers = Supplier.all()
  @categories = Category.all()
  erb(:"products/new")
end

post '/products' do
  product = Product.new(params)
  product.save()
  redirect to("/products")
end

get '/products/:id/delete' do

end
