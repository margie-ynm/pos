require('spec_helper')

describe(Purchase) do
  describe("create new purchase") do
    it "calculate the total price of the customers purchase" do
      test_product = Product.create({:name => "milk", :price => 2.3, :inventory => 56, :description => "it's 2 percent milk"})
      test_product2 = Product.create({:name => "protein", :price => 4.2, :inventory => 40, :description => "20 grams of protein"})
      test_product3 = Product.create({:name => "hot sauce", :price => 1.99, :inventory => 31, :description => "its super spicy"})
      test_customer = Customer.create({:name => "Margie", :email => "email@gmail.com"})
      test_purchase1 = Purchase.create({:date => "2016-12-12", :product_id => test_product.id, :customer_id => test_customer.id, :quantity => 2, :price => test_product.price})
      test_purchase2 = Purchase.create({:date => "2016-12-12", :product_id => test_product2.id, :customer_id => test_customer.id, :quantity => 2, :price => test_product2.price})
      test_purchase3 = Purchase.create({:date => "2016-12-12", :product_id => test_product3.id, :customer_id => test_customer.id, :quantity => 2, :price => test_product3.price})
      expect(Purchase.calculate_price(test_customer.id, '2016-12-12')).to eq(16.98)
    end
  end
end
