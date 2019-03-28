class SessionsController < ApplicationController
    # Serve the sign in form
    def new

    end 
    # Handle the submssionof the sign in the form
    def create
    @user = User.find_by(name: params[:username])
    if @user.authenticate(params[:password])
        session[:current_user_id] = @user.id
    end
 end
end 