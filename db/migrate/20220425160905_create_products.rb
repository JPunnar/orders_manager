class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.decimal :price
      t.string :product_id
      t.integer :quantity
      t.json :replaced_with
      t.string :order_id
    end
  end
end
