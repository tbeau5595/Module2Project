class UserRewardsController < ApplicationController
    
    def index

    end

    def show
        @user_reward = UserReward.find_by(user_id: @user.id)
        total = 0
        @user.donations.each do |donation|
            total += donation.amount
            if total <= 100
                @user_reward.update(reward_id: 1)
            elsif 100 < total <= 250
                @user_reward.update(reward_id: 2)
            elsif 250 < total <= 500
                @user_reward.update(reward_id: 3)
            elsif 500 < total
                @user_reward.update(reward_id: 4)
            end
        end   
    end

    def new

    end

    def edit

    end

    def create

    end

    def update

    end

    def user_reward_params
        params.require(:user_reward).permit(:user_id, :reward_id)
    end
end
