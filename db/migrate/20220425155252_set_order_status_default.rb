class SetOrderStatusDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :status, 'NEW'
  end
end
