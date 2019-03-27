class Donation < ApplicationRecord
    belongs_to :user
    belongs_to :charity
    validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
end
