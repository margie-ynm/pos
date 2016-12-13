class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:price, :float)
      t.column(:inventory, :integer)
      t.column(:description, :string)

      t.timestamps()
  end

    create_table(:customers) do |t|
      t.column(:name, :string)
      t.column(:email, :string)

      t.timestamps()
  end
    create_table(:purchases) do |t|
      t.column(:product_id, :int)
      t.column(:customer_id, :int)
      t.column(:date, :date)
      t.column(:quantity, :int)

      t.timestamps()
  end

end
end
