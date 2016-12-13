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

get('/product/:id') do
  @product = Product.find(params.fetch('id').to_i)
  erb(:product)
end

patch('/product_new/:id') do
  @product = Product.find(params.fetch('id').to_i)
  name = params.fetch('new name')
  price = params.fetch('new price')
  inventory = params.fetch('new inventory')
  description = params.fetch('new description')
  @product.update({:name => name, :price => price, :inventory => inventory, :description => description})
  redirect '/'
end

delete('/product/:id') do
  @product = Product.find(params.fetch('id').to_i)
  @product.destroy()

  redirect '/'
end
