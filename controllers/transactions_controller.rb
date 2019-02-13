require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/category' )
require_relative( '../models/product' )
require_relative( '../models/supplier' )
# require_relative( '../models/transaction' )
also_reload( '../models/*' )

get '/' do
  erb( :index )
end
