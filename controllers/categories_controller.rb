require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/category' )
require_relative( '../models/product' )
require_relative( '../models/supplier' )
also_reload( '../models/*' )

get '/categories' do
  @categories = Category.all()
  erb(:"categories/index")
end

get '/categories/new' do
  erb( :"categories/new" )
end

post '/categories' do
  category = Category.new(params)
  category.save()
  redirect to "/categories"
end

get '/categories/:id/edit' do
  @category = Category.find(params['id'].to_i)
  erb( :"categories/edit")
end

post '/categories/:id' do
  category = Category.new(params)
  category.update()
  redirect to "/categories"
end

post '/categories/:id/delete' do
  Category.delete(params[:id])
  redirect to("/categories")
end
