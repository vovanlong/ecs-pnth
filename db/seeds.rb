# 20.times do |n|
#     User.create! email: "customer#{n+1}@gmail.com",
#                  password: "123123",
#                  name: Faker::Name.name,
#                  address: Faker::Address.full_address,
#                  phone_number: Faker::PhoneNumber.cell_phone ,
#                  role: 1
# end

# 20.times do |n|
#     User.create! email: "vovanlong#{n+1}@gmail.com",
#                  password: "123123",
#                  name: Faker::Name.name,
#                  address: Faker::Address.full_address,
#                  phone_number: Faker::PhoneNumber.cell_phone ,
#                  role: 2
# end

# User.create!(email: "admin@gmail.com",
#              password: "123123",
#              name: "vovanlong",
#              address: Faker::Address.full_address,
#              phone_number: Faker::PhoneNumber.cell_phone ,
#              role: 0)

#  Category.create(name: "Thiết bị điện tử",
#                 description: Faker::Lorem.paragraph(2, true, 4),
#                 parent_id: 0)

#  Category.create(name: "Phụ kiện điện tử",
#                 description: Faker::Lorem.paragraph(2, true, 4),
#                 parent_id: 0)

#  Category.create(name: "Máy tính PC",
#                 description: Faker::Lorem.paragraph(2, true, 4),
#                 parent_id: 0)

# Category.create(name: "Máy Tính LapTop",
#                 description: Faker::Lorem.paragraph(2, true, 4),
#                 parent_id: 0)
                
# # Category.create(name: "Clothing, Shoes & Jewelry",
# #                 description: Faker::Lorem.paragraph(2, true, 4),
# #                 parent_id: 0)

# Category.create(name: "Sách IT",
#                 description: Faker::Lorem.paragraph(2, true, 4),
#                 parent_id: 0)

# 50.times do |n|
#   Category.create name: Faker::Book.author,
#                   description: Faker::Lorem.paragraph(2, true, 4),
#                   parent_id: Faker::Number.between(1, 5)
# end

# 80.times do |n|
#   Product.create name: Faker::Name.name,
#                  preview: Faker::Lorem.paragraph_by_chars(150, false),
#                  description: Faker::Lorem.paragraph_by_chars(750, false),
#                  price: Faker::Number.decimal(2),
#                  quantity: Faker::Number.between(1, 50),
#                  avg_star: Faker::Number.between(3, 5),
#                  category_id: Faker::Number.between(6, 50),
#                  user_id: 41
# end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/canon1.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(1, 80)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/canon2.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(1, 80)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/cable1.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(1, 80)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/nikon1.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(1, 80)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/nikon1.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(81, 160)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/nikon2.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(81, 160)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/nikon3.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(81, 160)
end


20.times do |n|
  images = Rails.root.join("app/assets/images/examples/sony1.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(81, 160)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/sony3.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(1, 80)
end

20.times do |n|
  images = Rails.root.join("app/assets/images/examples/sony4.jpg").open
  Photo.create image: images,
               product_id: Faker::Number.between(1, 80)
end


>>>>>>> index-cart
