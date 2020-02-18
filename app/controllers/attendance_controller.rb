class AttendanceController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def create
    @attend = Attendance.new(user_id: current_user.id, 
                             event_id: params[:event_id],
                             stripe_customer_id: params[:card])
    if @attend.save
      redirect_to '/'
    else
      render 'event#new'
    end
  end
end
