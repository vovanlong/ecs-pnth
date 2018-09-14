20.times do |n|
    User.create! email: "customer#{n+1}@gmail.com",
                 password: "123123",
                 name: Faker::Name.name,
                 address: Faker::Address.full_address,
                 phone_number: Faker::PhoneNumber.cell_phone ,
                 role: 1
end

20.times do |n|
    User.create! email: "vovanlong#{n+1}@gmail.com",
                 password: "123123",
                 name: Faker::Name.name,
                 address: Faker::Address.full_address,
                 phone_number: Faker::PhoneNumber.cell_phone ,
                 role: 2
end

User.create!(email: "admin@gmail.com",
             password: "123123",
             name: "vovanlong",
             address: Faker::Address.full_address,
             phone_number: Faker::PhoneNumber.cell_phone ,
             role: 0)

 Category.create(name: "Movies, Music & Games",
                description: Faker::Lorem.paragraph(2, true, 4),
                parent_id: 0)

 Category.create(name: "Home, Garden, Pets & Tools",
                description: Faker::Lorem.paragraph(2, true, 4),
                parent_id: 0)

 Category.create(name: "Food & Grocery",
                description: Faker::Lorem.paragraph(2, true, 4),
                parent_id: 0)

Category.create(name: "Beauty & Health",
                description: Faker::Lorem.paragraph(2, true, 4),
                parent_id: 0)
                
# Category.create(name: "Clothing, Shoes & Jewelry",
#                 description: Faker::Lorem.paragraph(2, true, 4),
#                 parent_id: 0)

Category.create(name: "Books & Audible",
                description: Faker::Lorem.paragraph(2, true, 4),
                parent_id: 0)

50.times do |n|
  Category.create name: Faker::Book.author,
                  description: Faker::Lorem.paragraph(2, true, 4),
                  parent_id: Faker::Number.between(1, 6)
end

10.times do |n|
  Product.create name: Faker::Name.name,
                 description: Faker::Lorem.paragraph_by_chars(256, false),
                 price: Faker::Number.decimal(2),
                 quantity: Faker::Number.between(1, 50),
                 avg_star: Faker::Number.between(1, 10),
                 category_id: Faker::Number.between(0, 10),
                 user_id: 41
end

# 10.times do |n|
#   Photo.create image: Faker::Avatar.image("my-own-slug", "50x50"),
#                product_id: Faker::Number.between(1, 10)
# end

