class Admin::EventsController < ApplicationController
  layout 'admin'
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end
  
  
  
  def new
    @event = Event.new
  end
  
  def create
  event_params = params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
  @event = Event.new(event_params)
  @event.save
  redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
  end
  
  
  
  def update
    
    event_params = params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    @event.update(event_params)
    redirect_to admin_event_path(@event), notice: 'Event was successfully update.'
  end
  
  def destroy
    
    @event.destroy
    redirect_to  admin_events_path(@event), notice: 'Event was successfully destroy.'
  end
  
  private
    def set_event
      @event = Event.find(params[:id])
    end
  
end
