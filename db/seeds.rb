# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

order_count = 20
product_count = 20
category_count = 4
product_variants_count = 10

# create the categories
category_count.times do
    
    name = ''
    
    # generate unique category name
    loop do
        name = Faker::Commerce.department
        break unless Category.exists?(name: name)
    end
    
    Category.create(
        name: name
    )  
end

# create the products
product_count.times do 
    
    name = ''
    
    # generate unique product name
    loop do 
        name = Faker::Commerce.product_name
        break unless Product.exists?(name: name)
    end
    
    Product.create(
        name: name, 
        price: Faker::Commerce.price, 
        description: Faker::Lorem.paragraph, 
        stock: Faker::Number.between(1, 50), 
        artist_name: Faker::Artist.name, 
        image: Faker::LoremFlickr.image("1000x1365", ['painting']), 
        sku: Faker::Lorem.characters(10)  
    )
end

# create the product categories relationships
product_count.times do
    ProductCategory.create(
        product_id: Faker::Number.between(1, product_count),
        category_id: Faker::Number.between(1, category_count)
    )
end

# create the product variants
product_variants_count.times do 
    ProductVariant.create(
        variant: 'Size',
        # description: Faker::Variant.option,
        description: Faker::Commerce.material,
        price: Faker::Commerce.price,
        stock: Faker::Number.between(1, 50),
        image: Faker::LoremFlickr.image("1000x1365", ['painting']), 
        sku: Faker::Lorem.characters(10),
        product_id: Faker::Number.between(1, product_count),
    )
end

# create the orders
order_count.times do 
  Order.create(
        order_number: Faker::Lorem.characters(10),
        total_price: Faker::Commerce.price,
        delivery_address: Faker::Address.full_address,
        payment_method: 'Credit Card',
        note: Faker::Lorem.paragraph,
        # status: Faker::Order.status,
        status: 'complete',
        # user seeders to be created
        user_id: 1 
    ) 
end

# create the order items
order_count.times do
    order = ''
    
    # ensure every order generated has at least 1 order item
    loop do 
        order = Faker::Number.between(1, order_count)
        break unless OrderItem.exists?(order_id: order)
    end
    
    OrderItem.create(
        order_id: order,
        product_id: Faker::Number.between(1, product_count)
    )
end
