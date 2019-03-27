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


25.times do 
    User.create(
    name: Faker::Name.unique.name,
    account_number: Faker::Bank.unique.account_number
    )
end

10.times do
    Charity.create(
    name: Faker::Company.unique.name,
    description: Faker::Company.industry    
    )
end

100.times do
    Donation.create(
    user_id: User.all.sample.id,
    charity_id: Charity.all.sample.id,
    amount: Faker::Number.within(30..100),      
    )
end

Reward.create(level: "Bronze", gift_card: "None yet!")
Reward.create(level: "Silver", gift_card: "$5 Gift Card")
Reward.create(level: "Gold", gift_card: "$20 Gift Card")
Reward.create(level: "Platinum", gift_card: "$50 Gift Card")

def create_user_reward
    User.all.each do |user|
        UserReward.create(user_id: user.id, reward: Reward.find_by(level: "Bronze"))
    end
end

create_user_reward
puts "Seeded!"