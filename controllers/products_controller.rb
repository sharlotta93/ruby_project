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
  erb( :"products/index" )
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

get '/products/:id' do
  @product = Product.find(params['id'].to_i)
  erb( :"products/show" )
end

get '/products/:id/edit' do
  @suppliers = Supplier.all()
  @categories = Category.all()
  @product = Product.find(params['id'].to_i)
  erb(:"products/edit")
end

post '/products/:id' do
  product = Product.new(params)
  product.update()
  redirect to "/products/#{params['id']}"
end

get '/products/supplier/:id' do
  @products = Product.by_supplier(params['supplier_id'].to_i)
  erb(:"products/supplier")
end

post '/products/:id/delete' do
  Product.delete(params[:id])
  redirect to("/products")
end
