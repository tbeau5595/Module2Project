class User < ApplicationRecord
    
    has_many :donations
    has_many :charities, through: :donations
    has_one :user_reward
    has_one :reward, through: :user_reward

    validates :account_number, :uniqueness => true, :length => {is: 10}

    def largest_donation
        donation_amounts = Donation.all.map do |donation|
            donation.amount
        end
        Donation.find_by(amount: donation_amounts.max)    
    end

    def user_donations
        self.donations
    end

    def user_reward_level
        self.reward.level
    end

    def user_reward_id
        self.reward.id
    end

    def total_donations
        total = 0
        self.donations.each do |donation|
            total += donation.amount
        end
    end

    def user_with_largest_donation(largest_donation)
        User.find(largest_donation.user_id)
    end

    def user_with_most_donations
        users_donations = Donation.all.map do |donation|
            donation.user_id
        end
        donations_for_each_user = Hash[users_donations.uniq.map {|i| [i, users_donations.count(i)]}]
        User.find(donations_for_each_user.key(donations_for_each_user.max))
    end
end
