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

User.create!(email: "admin@gmail.com",
             password: "123123",
             name: "vovanlong",
             address: Faker::Address.full_address,
             phone_number: Faker::PhoneNumber.cell_phone ,
             role: 0)

# 20.times do |n|
#   Category.create name: Faker::Book.author,
#                   description: Faker::Lorem.paragraph(2, true, 4),
#                   parent_id: Faker::Number.between(0, 1)
# end