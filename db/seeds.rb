# frozen_string_literal: true

require 'faker'

# Creating test user
user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: 'test@gmail.com', password: 'Simform@123',
                   birthday: Faker::Date.in_date_period)

# Creating basic Rewards which can be used in the applications
Reward.create(name: '5% Cash Rebate', description: '5% Cash Rebate reward is given to all users who have 10 or more transactions th
	at have an amount ')
Reward.create(name: 'Free Coffee', description: 'Free coffee at the starbucks')
Reward.create(name: 'Free Movie ticket', description: 'Free PVR movie ticket')
Reward.create(name: 'Airport Lounge Access Reward', description: ' Airport Lounge Access Reward')

# Creating sample transaction from india
user.transactions.create(latitude: 21.295132, longitude: 81.828232, amount: Faker::Number.number(digits: 3))
user.transactions.create(latitude: 21.295132, longitude: 81.828232, amount: Faker::Number.number(digits: 4))

# Creating sample transaction from United states
user.transactions.create(latitude: 37.773972, longitude: -122.431297, amount: Faker::Number.number(digits: 3))
user.transactions.create(latitude: 37.773972, longitude: -122.431297, amount: Faker::Number.number(digits: 4))
