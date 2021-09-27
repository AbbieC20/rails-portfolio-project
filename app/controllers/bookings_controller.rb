class BookingsController < ApplicationController 
    before_action :require_login
    
    def create
      sub = !booking_params[:subscribed].nil? #this tells us whether the user has subscribed or not - subscribed = TRUE
      booking = Booking.new(user_id: current_user.id, event_id: booking_params[:event_id], subscribed: sub)
      if booking.save
        response = booking.make_booking
        flash[:notice] = response
        redirect_to root_url
      else
        redirect_to new_event_path
      end
    end


    private
  
    def booking_params
      params.permit(:event_id, :subscribed)
    end

end