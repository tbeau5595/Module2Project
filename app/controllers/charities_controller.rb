class CharitiesController < ApplicationController
    def index
        @charities = Charity.all
    end

    def show
        @charity = Charity.find(params[:id])
    end

    def new
        @charity = Charity.new
    end

    def create
        @charity = Charity.new(charity_params)
        if @charity.valid?
            @charity.save
            redirect_to charity_path(@charity.id)
        else
            redirect_to new_charity_path
        end
    end

    def charity_params
        params.require(:charity).permit(:name, :description)
    end

end