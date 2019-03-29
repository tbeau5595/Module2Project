class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @user_reward = UserReward.find_by(user_id: @user.id)
        if @user_reward == nil
            @user_reward = UserReward.create(user_id: @user.id, reward_id: 1)
        end
        @total = 0
        @user.donations.each do |donation|
            @total += donation.amount            
        end
            if @total < 100
                @user_reward.update(reward_id: 1)
            elsif @total < 250
                @user_reward.update(reward_id: 2)
            elsif @total < 500
                @user_reward.update(reward_id: 3)
            elsif 500 <= @total
                @user_reward.update(reward_id: 4)
            end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user.id)
        else
            redirect_to new_user_path
        end
    end

    def user_params
        params.require(:user).permit(:name, :account_number)
    end
end
