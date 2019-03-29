class RewardsController < ApplicationController

    def show
        @reward = Reward.find(params[:id])
    end

    def reward_params
        params.require(:reward).permit(:type)
    end
end
