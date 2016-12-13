require('./lib/product')
class Purchase < ActiveRecord::Base
  belongs_to :customers
  belongs_to :products


  define_singleton_method(:calculate_price) do |id, date|
    total_cost = 0
    purchases = Purchase.where("customer_id = #{id} AND date = '#{date}'")
    purchases.each() do |purchase|
      total_cost+= (purchase.quantity * purchase.price)
    end
    total_cost
  end

end
