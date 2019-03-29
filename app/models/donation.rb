class Donation < ApplicationRecord
    belongs_to :user
    belongs_to :charity
    validates :amount, :numericality => { :greater_than => 0 }
 
end
