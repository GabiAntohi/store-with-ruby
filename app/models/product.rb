class Product < ApplicationRecord
    # field validation
    validates :name, :price, :stock, presence: true
    
    # association with categories through our join table product_categories
    has_many :product_categories
    has_many :categories, through: :product_categories
end
