class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @event = Event.all
  end

  def create
    @start = params[:start].to_s.split('"')[3].to_time 
    puts @start
    @event = Event.new(title: params[:title], 
                        description: params[:editor],
                        start: @start,
                        duration: params[:duration],
                        location: params[:adress],
                        user_id: current_user.id,
                        price: params[:price])
    if @event.save
      redirect_to '/'
    else
      puts "pouet"
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
