class DonationsController < ApplicationController
    def index
        @donation_amounts = Donation.all.map do |donation|
            donation.amount
        end
        @largest_donation = @donation_amounts.max
        @charities = Charity.all
        
        @charities_donations = Donation.all.map do |donation|
            donation.charity_id
        end

        @donations_for_each_charity = Hash[@charities_donations.uniq.map {|i| [i, @charities_donations.count(i)]}]

        @most_donated_to = @donations_for_each_charity.values.max
        @most_donated_to_charity = Charity.find(@donations_for_each_charity.key(@most_donated_to))
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
        
        redirect_to users_path
    end

    def update

    end

    def donation_params
        params.require(:donation).permit(:user_id, :charity_id, :amount)
    end
end
