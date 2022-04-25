class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :status, null: false
      t.decimal :discount, default: 0.00
      t.decimal :paid, default: 0.00
      t.decimal :returns, default: 0.00
      t.decimal :total, default: 0.00
      t.timestamps
    end
  end
end
