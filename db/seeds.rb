AdminUser.create!(
    email: 'j.s.d.minkey@gmail.com',
    password: 'asdfasdf',
)
puts "1 admin user created!"

User.create!(
    email: 'j.s.d.minkey@gmail.com',
    password: 'asdfasdf',
    confirmed_at: Time.now
)

puts "1 user created!"