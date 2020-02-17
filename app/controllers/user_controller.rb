class UserController < ApplicationController

  def create
      @user = User.new(first_name: params[:first_name],
                       last_name: params[:last_name],
                       email: params[:email],
                       description: params[:description],
                       password: params[:password],
                       password_confirmation: params[:confirm])
      if@user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
          @error = @user.errors
          render 'new'
        end
  end

end
