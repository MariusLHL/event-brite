class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end
  def create
    date = DateTime.new(params[:date][:year].to_i, 
                        params[:date][:month].to_i, 
                        params[:date][:day].to_i, 
                        params[:date][:hour].to_i,
                        params[:date][:minute].to_i)
    
    @event = Event.new(title: params[:title], 
                        description: params[:editor],
                        start: date,
                        duration: params[:duration],
                        location: params[:adress],
                        user_id: current_user.id,
                        price: params[:price])
    if @event.save
      redirect_to '/'
    else
      render :new
    end          
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
    @end = end_date(@event.start, @event.duration)
    @attendee = @event.user
    if current_user != nil
      @attend =  @attendee.find_by(id: current_user.id)
    end 
    @content = @event.description.bbcode_to_html 
  end

  private

  def end_date(start, duration)
    return (start + duration * 60)
  end
end
