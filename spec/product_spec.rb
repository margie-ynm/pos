require('spec_helper')

describe(Product) do
  describe("temp") do
    it("check if it works") do
      product = Product.create({:name => "milk", :price => 2.3, :inventory => 56, :description => "it's 2 percent milk"})
      expect(Product.all).to eq([product])
    end
  end
end
