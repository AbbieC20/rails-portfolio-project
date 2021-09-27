class EventsController < ApplicationController

    def index
        @events = Event.all
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

    def popular_events
      if current_user.admin
        @event_attendances = Event.events_by_attendance
      else
        flash[:notice] = "You must have Admin Access to perform that function!"
        redirect_to root_url
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
