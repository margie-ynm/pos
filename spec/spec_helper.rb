ENV['RACK_ENV'] = 'test'
require('rspec')
require('sinatra/activerecord')
require('customer')
require('purchase')
require('product')

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
    Purchase.all().each() do |purchase|
      purchase.destroy()
    end
    Customer.all().each() do |customer|
      customer.destroy()
    end
  end
end
