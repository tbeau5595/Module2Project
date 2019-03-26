class UserRewardsController < ApplicationController
    
    def index

    end

    def show
        @user_reward = UserReward.find(params[:id])
        if @user_reward.reward_id == 1
            @reward = "None Yet!"
        elsif @user_reward.reward_id == 2
            @reward = "$5 gift card"
        elsif @user_reward.reward_id == 3
            @reward = "$20 gift card"
        elsif @user_reward.reward_id == 4
            @reward = "$50 gift card"
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
