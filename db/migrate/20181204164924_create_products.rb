class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.decimal :price, precision: 10, scale: 2, null:false
      t.text :description
      t.integer :stock, null:false
      t.string :artist_name
      t.string :image
      t.string :sku

      t.timestamps
    end
  end
end
