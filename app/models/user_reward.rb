class UserReward < ApplicationRecord
    belongs_to :user
    belongs_to :reward
  
    def bronze_users
        UserReward.where(reward_id: 1).map do | bronze_user_reward |
            User.find(bronze_user_reward.user_id) 
        end
    end

    def number_of_bronze_users(bronze_users)
        bronze_users.count
    end

    def silver_users
        UserReward.where(reward_id: 2).map do | silver_user_reward |
            User.find(silver_user_reward.user_id) 
        end
    end

    def number_of_silver_users(silver_users)
        silver_users.count
    end

    def gold_users
        UserReward.where(reward_id: 3).map do | gold_user_reward |
            User.find(gold_user_reward.user_id) 
        end
    end

    def number_of_gold_users(gold_users)
        gold_users.count
    end

    def platinum_users
        UserReward.where(reward_id: 4).map do | platinum_user_reward |
            User.find(platinum_user_reward.user_id) 
        end
    end

    def number_of_platinum_users(platinum_users)
        platinum_users.count
    end

    def users_reward
        self.reward.gift_card
    end
end
