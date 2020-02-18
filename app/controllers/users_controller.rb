class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find_by(id: current_user.id)
    @event = @user.event
  end
end
