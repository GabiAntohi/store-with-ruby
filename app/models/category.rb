class Category < ApplicationRecord
    # field validation
    validates :name, presence: true
    
    # association with products through our join table product_categories
    has_many :product_categories
    has_many :products, through: :product_categories
end
