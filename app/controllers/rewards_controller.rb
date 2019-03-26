class RewardsController < ApplicationController
    def index

    end

    def show
        @reward = Reward.find(params[:id])
    end

    def new

    end

    def edit

    end

    def create
        
    end

    def update

    end

    def reward_params
        params.require(:reward).permit(:type)
    end
end
