class DonationsController < ApplicationController
    def index

    end

    def show
        @donation = Donation.find(params[:id])
    end

    def new
        @donation = Donation.new
    end

    def edit

    end

    def create
        @donation = Donation.new(donation_params)
        @donation.save
        # redirect_to :controller => 'user_rewards', :action 'update'
        redirect_to users_path
    end

    def update

    end

    def donation_params
        params.require(:donation).permit(:user_id, :charity_id, :amount)
    end
end
