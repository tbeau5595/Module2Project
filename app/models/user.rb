class User < ApplicationRecord
    
    has_many :donations
    has_many :charities, through: :donations
    has_one :user_reward
    has_one :reward, through: :user_reward

    validates :account_number, :uniqueness => true, :length => {is: 10}

    
end
