40.times do |n|
    User.create! email: "#{Faker::Internet.user_name}@gmail.com",
                 password_digest: "123123",
                 name: Faker::Name.name,
                 address: Faker::Address.full_address,
                 phone_number: Faker::PhoneNumber.cell_phone ,
                 role: 1
end