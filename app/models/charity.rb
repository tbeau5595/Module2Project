class Charity < ApplicationRecord
    has_many :donations
    has_many :users, through: :donations

    def largest_donation
        donation_amounts = Donation.all.map do |donation|
            donation.amount
        end
        Donation.find_by(amount: donation_amounts.max)    
    end

    def charity_with_highest_total
        total = 0
        self.donations.each do |donation|
            total += donation.amount
        end
        Charity
    end

    def most_donated_to_charity
        charities_donations =  Donation.all.map do |donation|
            donation.charity_id
        end
        donations_for_each_charity = Hash[charities_donations.uniq.map {|i| [i, charities_donations.count(i)]}]
        Charity.find(donations_for_each_charity.key(donations_for_each_charity.max))
     end

     def chraity_with_largest_donation(largest_donation)
        Chraity.find(largest_donation.chraity_id)
    end
end
