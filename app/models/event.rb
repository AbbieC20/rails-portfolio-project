require 'date'

class Event < ApplicationRecord
    has_many :bookings
    has_many :users, :through => :bookings
    belongs_to :organiser
    belongs_to :sponsor
    scope :events_by_attendance, ->(max_events = 3) { joins(:bookings).group('event_id').select('events.*, COUNT(user_id) as attendees').order(attendees: :desc).limit(max_events) }
    validates :name, presence: true
    validates :location, presence: true
    validates :date_field, presence: true
    validates :time, presence: true
    validates :organiser, presence: true
    validates :sponsor, presence: true

    def show_date 
        self.date.strftime("%d %B %Y") 
    end

    def date_field
        if !self.date.nil?
            self.show_date
        else
            ""
        end
    end

    def date_field=(date_string)
        begin
            self.date = Date.parse(date_string)
        rescue
            self.date = nil
        end
    end

end
