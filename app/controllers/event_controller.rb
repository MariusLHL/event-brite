class EventController < ApplicationController
  before_action :authenticate_user, only: [:new]

  def index
    @event = Event.all
  end

  def create
    @start = params[:start].to_s.split('"')[3].to_time 
    @end =  params[:end].to_s.split('"')[3].to_time
    @start_at = params[:start_at].to_time
    @end_at = params[:end_at].to_time
    @date_start = DateTime.new(@start.year, @start.month, @start.day, @start_at.hour, @start_at.min, @start_at.sec, @start_at.zone)
    @date_end = DateTime.new(@end.year, @end.month, @end.day, @end_at.hour, @end_at.min, @end_at.sec, @end_at.zone)

    @event = Event.new(title: params[:title], 
                        content: params[:editor],
                        start: @date_start,
                        end: @date_end,
                        location: params[:adress],
                        user_id: current_user.id,
                        price: params[:price])
    if @event.save
      puts @date_end - @date_start 
      redirect_to '/'
    else
      redirect :new
    end          
  end

  def show
    @event = Event.find(params[:id])
    @content = @event.content.bbcode_to_html 
  end
end
