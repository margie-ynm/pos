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

get('/purchase_new') do
  @customers = Customer.all()
  @products = Product.all()
  erb(:purchase_form)
end

get('/customer_new') do
  erb(:customer_form)
end

get('/customers') do
  @customers = Customer.all()
  erb(:customers)
end
post('/customer_new') do
  name = params.fetch('name')
  email = params.fetch('email')
  Customer.create({:name => name, :email => email})
  redirect '/customers'
end

get('/customer/:id') do
  @customer = Customer.find(params.fetch('id').to_i)
  erb(:customer)
end


patch('/customer_new/:id') do
  @customer = Customer.find(params.fetch('id').to_i)
  name = params.fetch('name')
  email = params.fetch('email')
  @customer.update({:name => name, :email => email})
  redirect '/customers'
end

delete('/customer/:id') do
  @customer = Customer.find(params.fetch('id').to_i)
  @customer.destroy()
  redirect '/customers'
end

post('/purchase_new') do
  @products_id = params.fetch('products')
  @quantities = @products_id.map {|id| params.fetch('quantity_'+id) }
  @customer = Customer.find(params.fetch('customer_id').to_i)
  @products_id.each_with_index do |product,index|
    p "hello",product.to_i, @customer.id, @quantities[index], Product.find(product.to_i).price
    Purchase.create({:date => "2016-12-12", :product_id => product.to_i, :customer_id => @customer.id, :quantity => @quantities[index], :price => Product.find(product.to_i).price})
  end
  erb(:receipt)
end
