class OrderItem < ApplicationRecord
    validates :quantity, presence: true
end
