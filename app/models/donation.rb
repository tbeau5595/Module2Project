class Donation < ApplicationRecord
    belongs_to :user
    belongs_to :charity
    validates :amount, :numericality => { :greater_than => 0 }

    def largest_donation
        donation_amounts = Donation.all.map do |donation|
            donation.amount
        end
        Donation.find_by(amount: donation_amounts.max)    
    end
end
