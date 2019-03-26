# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Donation.destroy_all
Charity.destroy_all
Reward.destroy_all
UserReward.destroy_all

# 30.times do 
#     user = User.create({
#       name: Faker::name.name,
#       account_number: Faker::bank.account_number
#       ammount_donated: Faker::number.within(1..1000)
#     })
# end

User.create(name: "Name 1", account_number: 1234567890)
User.create(name: "Name 2", account_number: 1236547890)
User.create(name: "Name 3", account_number: 1234569870)
User.create(name: "Name 4", account_number: 3214567890)
  
  
# 30.times do
#     donation = Donation.create({
#       ammount: Faker::number.within(1..100),      
#     })
# end


Charity.create(name: "Charity 1", description: "description")
Charity.create(name: "Charity 2", description: "description")
Charity.create(name: "Charity 3", description: "description")
Charity.create(name: "Charity 4", description: "description")
Charity.create(name: "Charity 5", description: "description")

Reward.create(level: "bronze")
Reward.create(level: "silver")
Reward.create(level: "gold")
Reward.create(level: "platinum")
  
UserReward.create(user_id: 1, reward_id: 1)
UserReward.create(user_id: 2, reward_id: 2)
UserReward.create(user_id: 3, reward_id: 3)
UserReward.create(user_id: 4, reward_id: 4)


Donation.create(user_id: 1, charity_id: 2, amount: 20)
Donation.create(user_id: 1, charity_id: 1, amount: 20)
Donation.create(user_id: 1, charity_id: 3, amount: 20)
Donation.create(user_id: 1, charity_id: 4, amount: 20)
Donation.create(user_id: 1, charity_id: 5, amount: 20)
Donation.create(user_id: 2, charity_id: 1, amount: 20)
Donation.create(user_id: 2, charity_id: 2, amount: 200)
Donation.create(user_id: 2, charity_id: 3, amount: 20)
Donation.create(user_id: 2, charity_id: 4, amount: 20)
Donation.create(user_id: 2, charity_id: 5, amount: 20)
Donation.create(user_id: 3, charity_id: 1, amount: 20)
Donation.create(user_id: 3, charity_id: 2, amount: 20)
Donation.create(user_id: 3, charity_id: 3, amount: 20)
Donation.create(user_id: 3, charity_id: 4, amount: 450)
Donation.create(user_id: 3, charity_id: 5, amount: 20)
Donation.create(user_id: 4, charity_id: 1, amount: 20)
Donation.create(user_id: 4, charity_id: 2, amount: 20)
Donation.create(user_id: 4, charity_id: 3, amount: 20)
Donation.create(user_id: 4, charity_id: 4, amount: 20)
Donation.create(user_id: 4, charity_id: 5, amount: 1000)

# 10.times do
#     charity = Charity.create({
#       name: Faker::name.initials
#       description: Faker::lorem.paragraph    
#     })
# end



# donation = donations.map { |donation| donation.merge( { user_id: User.all.sample.id, charity_id: Charity.all.sample.id } ) }