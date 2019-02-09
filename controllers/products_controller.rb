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

get '/products/:id' do
  @product = Product.find(params['id'].to_i)
  erb( :"products/show" )
end

post '/products' do
  product = Product.new(params)
  product.save()
  redirect to("/products")
end

post '/products/:id/delete' do
  Product.delete(params[:id])
  redirect to("/products")
end
