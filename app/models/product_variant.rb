class ProductVariant < ApplicationRecord
    validates :variant, :price, :stock, presence: true
end
