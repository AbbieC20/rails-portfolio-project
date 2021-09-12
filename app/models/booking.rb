class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :event

    def make_booking
        "You have successfully booked this event!"
    end

end
