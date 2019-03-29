class DonationsController < ApplicationController
    def index
        #finds largest donation
        @donation_amounts = Donation.all.map do |donation|
            donation.amount
        end
        @largest_donation_amount = @donation_amounts.max
        @largest_donation = Donation.find_by(amount: @largest_donation_amount)
        @user_with_largest_donation = User.find(@largest_donation.user_id)
        
        #finds most donated to charity
        @charities = Charity.all      
        @charities_donations = Donation.all.map do |donation|
            donation.charity_id
        end
        @donations_for_each_charity = Hash[@charities_donations.uniq.map {|i| [i, @charities_donations.count(i)]}]
        @most_donated_to = @donations_for_each_charity.values.max
        @most_donated_to_charity = Charity.find(@donations_for_each_charity.key(@most_donated_to))

        #find user with most donations
        @users_donations = Donation.all.map do |donation|
            donation.user_id
        end      
        @donations_for_each_user = Hash[@users_donations.uniq.map {|i| [i, @users_donations.count(i)]}]
        @most_donations = @donations_for_each_user.values.max
        @user_with_most_donations = User.find(@donations_for_each_user.key(@most_donations))
    end

    def show
        @donation = Donation.find(params[:id])
    end

    def new
        @donation = Donation.new
        @users = User.all
        @charities = Charity.all
    end

    def create
        @donation = Donation.new(donation_params)
        if @donation.valid?
            @donation.save
            redirect_to users_path
        else
            redirect_to new_donation_path
        end
    end

    def donation_params
        params.require(:donation).permit(:user_id, :charity_id, :amount)
    end
end
