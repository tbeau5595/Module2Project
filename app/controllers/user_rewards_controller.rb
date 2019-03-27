class UserRewardsController < ApplicationController
    
    def index
        @bronze_users = UserReward.where(reward_id: 1).map do | bronze_user_reward |
            User.find(bronze_user_reward.user_id)    
        end
        @silver_users = UserReward.where(reward_id: 2).map do | silver_user_reward |
            User.find(silver_user_reward.user_id)             
        end
        @gold_users = UserReward.where(reward_id: 3).map do | gold_user_reward |
            User.find(gold_user_reward.user_id)             
        end
        @platinum_users = UserReward.where(reward_id: 4).map do | platinum_user_reward |
            User.find(platinum_user_reward.user_id)             
        end
    end

    def show
        @user_reward = UserReward.find(params[:id])
        @gift_card = @user_reward.reward.gift_card
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
