class UsersController < ApplicationController

    
    def index
        

    end

    def show
        @user = User.find(params[:id])
        @user_reward = UserReward.find_by(user_id: @user.id)
        total = 0
        @user.donations.each do |donation|
            total += donation.amount            
        end
            if total < 100
                @user_reward.update(reward_id: 1)
            elsif total < 250
                @user_reward.update(reward_id: 2)
            elsif total < 500
                @user_reward.update(reward_id: 3)
            elsif 500 <= total
                @user_reward.update(reward_id: 4)
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

    def user_params
        params.require(:user).permit(:name, :account_number, :ammount_donated)
    end
end
