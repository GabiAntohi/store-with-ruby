class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.string :variant, null:false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null:false
      t.integer :stock, null:false
      t.string :image
      t.string :sku

      t.timestamps
    end
  end
end
