class UserRewardsController < ApplicationController
    
    def index

    end

    def show
        @user_reward = UserReward.find_by(user_id: @user.id)
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
