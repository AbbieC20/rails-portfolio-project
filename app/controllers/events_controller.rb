class EventsController < ApplicationController
   
    def index
        @events = Event.all
        @previous_events = current_user.events.where('date', DateTime.now)
    end

    def show
        @event = Event.find_by(id: params[:id])
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to events_url
      else 
        render :new
      end
    end

    private

    def find_event
      @event = Event.find_by(id: params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :location, :date_field, :time, :organiser_id, :sponsor_id)
    end
end
