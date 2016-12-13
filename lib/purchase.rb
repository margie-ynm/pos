class Purchase < ActiveRecord::Base
  belongs_to :customers
  belongs_to :products

  define_singleton_method(:calculate_price) do |id, start_date, end_date|
    total_cost = 0
    purchases = Purchase.where("customer_id = #{id} AND date >= '#{start_date}' AND date <= '#{end_date}'")
    purchases.each() do |purchase|
      total_cost+= (purchase.quantity * purchase.price)
    end
    total_cost
  end

  define_singleton_method(:purchases_by_date) do |start_date, end_date|
    purchases = Purchase.where("date >= '#{start_date}' AND date <= '#{end_date}'")
  end
end
