class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @event = Event.all
  end

  def create
    event = params[:start]
    @start = DateTime.new event["created_on(1i)"].to_i, event["created_on(2i)"].to_i, event["created_on(3i)"].to_i,event["created_on(4i)"].to_i, event["created_on(5i)"].to_i

    @event = Event.new(title: params[:title], 
                        description: params[:editor],
                        start: @start.to_time,
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

  def flatten_date_array hash
    %w(1 2 3).map { |e| hash["date(#{e}i)"].to_i }
  end
end
