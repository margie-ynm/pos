require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/customer')
require('./lib/product')
require('./lib/purchase')

get('/') do
@products = Product.all()
erb(:index)

end

get('/product_new') do

erb(:product_form)
end

post('/product_new') do
  name = params.fetch('name')
  price = params.fetch('price')
  inventory = params.fetch('inventory')
  description = params.fetch('description')
  Product.create({:name => name, :price => price, :inventory => inventory, :description => description})
  redirect '/'
end
