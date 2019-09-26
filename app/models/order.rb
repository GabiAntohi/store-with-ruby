class Order < ApplicationRecord
    validates :order_number, :total_price, :delivery_address, :payment_method, :status, presence: true
end
