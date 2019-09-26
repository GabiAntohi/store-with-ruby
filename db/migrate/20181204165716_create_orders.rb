class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_number, null:false
      t.decimal :total_price, precision: 10, scale: 2, null:false
      t.string :delivery_address, null:false
      t.string :payment_method, null:false
      t.text :note
      t.string :status, null:false

      t.timestamps
    end
  end
end
