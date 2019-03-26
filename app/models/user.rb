class User < ApplicationRecord
    
    has_many :donations
    has_many :charities, through: :donations
    has_one :user_reward
    has_one :reward, through: :user_reward
    
end
